#!/bin/bash
set -eux

#####
# Consul
#####

docker-compose \
  up --force-recreate -d \
  consul-server-0 consul-server-1 consul-server-2 consul-agent-1

#####
# Vault
#####

docker-compose up --force-recreate -d \
  vault_s1 vault_s2 vault_s3
export VAULT_ADDR=http://localhost:8200

printf "#==> Init vault_s1 \n"
#// Confirm that vault_s1 is listening on port 8200
sleep 1
while ! nc -w 1 127.0.0.1 8200 </dev/null; do sleep 1; done
vault operator init -format=json -n 1 -t 1 > /tmp/vault.init

export VAULT_TOKEN_PRIMARY=$(jq -r '.root_token' /tmp/vault.init)
printf "\nRoot VAULT TOKEN is: $VAULT_TOKEN_PRIMARY \n"
printf "\n*** Please Run: export VAULT_TOKEN=${VAULT_TOKEN_PRIMARY} \n"
export unseal_key=$(jq -r '.unseal_keys_b64[0]' /tmp/vault.init)
printf "\nUnseal Key is: ${unseal_key}\n"
export VAULT_TOKEN=${VAULT_TOKEN_PRIMARY}

vault operator unseal ${unseal_key}
while ! vault operator raft list-peers > /dev/null 2>&1 ; do 
  sleep 1; echo "waiting..."
done
vault operator raft autopilot state
sleep 1

for i in {2..3}; do
docker exec -i vault_s${i} sh <<EOM
printf "\n#==> Unsealing:\n"
hostname
export VAULT_ADDR=http://localhost:8200
vault operator unseal ${unseal_key}
EOM
done



#####
# Prometheus Vault Integration
#####

# printf "$(jq -r '.root_token' /tmp/vault.init)" > prometheus/prometheus-token
printf "$(jq -r '.root_token' /tmp/vault.init)" > prometheus/prometheus-token

vault policy write prometheus-metrics - << EOF
path "/sys/metrics" {
  capabilities = ["read"]
}
EOF

docker-compose up --force-recreate -d prometheus
docker-compose up --force-recreate -d node-exporter
docker-compose up --force-recreate -d cadvisor


#####
# Grafana
#####

docker-compose up --force-recreate -d grafana
docker exec grafana grafana-cli plugins install grafana-piechart-panel
docker restart grafana