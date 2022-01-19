# Note: this file will be re-written by script
api_addr     = "http://10.5.0.102:8200"
cluster_addr = "https://10.5.0.102:8201"
cluster_name = "west"
disable_mlock = true

# Base Configuration
listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = "true"
#   #tls_cert_file = "/etc/ssl/certs/vault-server.crt"
#   #tls_key_file  = "/etc/ssl/vault-server.key"
}

ui = "true"
log_level="INFO"

# Raft configuration
storage "raft" {
  path    = "/vault/file"
  node_id = "vault_s2"
  retry_join {
    leader_api_addr = "http://vault_s1:8200"
  }
  retry_join {
    leader_api_addr = "http://vault_s2:8200"
  }
  retry_join {
    leader_api_addr = "http://vault_s3:8200"
  }
}

service_registration "consul" {
  address = "consul-server-0:8500"
}

telemetry {
  prometheus_retention_time = "30s"
  disable_hostname          = true
}
# raw_storage_endpoint = true #//for debugging
