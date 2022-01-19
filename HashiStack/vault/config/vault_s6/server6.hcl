# Note: this file will be re-written by script
api_addr     = "http://10.5.0.106:8200"
cluster_addr = "https://10.5.0.106:8201"
disable_mlock = true

# Base Configuration
listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = "true"
}

ui = "true"
log_level="INFO"

# Raft configuration
storage "raft" {
  path    = "/vault/file"
  node_id = "vault_s6"
  # retry_join {
  #   leader_api_addr = "http://vault_s4:8200"
  # }
  # retry_join {
  #   leader_api_addr = "http://vault_s5:8200"
  # }
  # retry_join {
  #   leader_api_addr = "http://vault_s6:8200"
  # }
}

service_registration "consul" {
  address = "consul-server-0:8500"
  service = "vault-6"
}

telemetry {
  prometheus_retention_time = "30s"
  disable_hostname          = true
}
# raw_storage_endpoint = true #//for debugging
