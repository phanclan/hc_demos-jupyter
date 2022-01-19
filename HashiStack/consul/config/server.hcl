datacenter  = "zone1" # in CLI
# node_name   = "ConsulServer" # in CLI or use hostname
bind_addr   = "0.0.0.0" #default
client_addr = "0.0.0.0" #default 127.0.0.1
data_dir    = "/consul/data"
log_level   = "DEBUG"

encrypt     = "hfCj/DnaWnrSlnKZV4nDu1hUSYNLEy5vGc+nBbrSXH0="
ca_file     = "/consul/cert/consul-agent-ca.pem"
cert_file   = "/consul/cert/zone1-server-consul-0.pem"
key_file    = "/consul/cert/zone1-server-consul-0-key.pem"
verify_incoming = true
verify_outgoing = true
verify_server_hostname = true

# server           =  true # in CLI
bootstrap_expect = 3
retry_join  = [ "consul-server-0", "consul-server-1", "consul-server-2" ]
ui_config { enabled = true } 

#// 5 is default multiplier
performance {
  raft_multiplier = 2 #// fast but not too fast
}

discovery_max_stale = "5s"

telemetry {
    prometheus_retention_time = "8h",
    disable_hostname = true
}

connect {
    enabled = true
}

enable_local_script_checks = true
