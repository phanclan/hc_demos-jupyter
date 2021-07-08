# #############################
# ### Vault Policy - Admin ####
# #############################

# Manage auth methods broadly across Vault
path "auth/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Create, update, and delete auth methods
path "sys/auth/*" {
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth" {
  capabilities = ["read"]
}

# Create and manage ACL policies
path "sys/policies/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# To list policies - Step 3
path "sys/policies/" {
  capabilities = ["list"]
}

# List, create, update, and delete key/value secrets mounted under secret/
path "secret/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# List secret/
path "secret/" {
  capabilities = ["list"]
}

# Prevent admin users from reading user secrets
# But allow them to create, update, delete, and list them
path "secret/users/*" {
  capabilities = ["create", "update", "delete", "list"]
}

# List, create, update, and delete key/value secrets mounted under kv/
path "kv/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# List kv/
path "kv/" {
  capabilities = ["list"]
}

# Prevent admin users from reading user secrets
# But allow them to create, update, delete, and list them
# Creating and updating are explicitly included here
# Deleting and listing are implied by capabilities given on kv/* which includes kv/delete/users/* and kv/metadata/users/* paths
path "kv/data/users/*" {
  capabilities = ["create", "update"]
}

# Active Directory secrets engine
path "ad/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Alicloud secrets engine
path "alicloud/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# AWS secrets engine
path "aws/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Azure secrets engine
path "azure/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Google Cloud secrets engine
path "gcp/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Google Cloud KMS secrets engine
path "gcpkms/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Consul secrets engine
path "consul/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Cubbyhole secrets engine
path "cubbyhole/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Database secrets engine
path "database/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Identity secrets engine
path "identity/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# PKI secrets engine
path "nomad/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Nomad secrets engine
path "pki/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# RabbitMQ secrets engine
path "rabbitmq/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# SSH secrets engine
path "ssh/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# TOTP secrets engine
path "totp/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Transit secrets engine
path "transit/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Create and manage secrets engines broadly across Vault.
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}

# List sys/mounts/
path "sys/mounts" {
  capabilities = ["read"]
}

# Check token capabilities
path "sys/capabilities" {
  capabilities = ["create", "update"]
}

# Check token accessor capabilities
path "sys/capabilities-accessor" {
  capabilities = ["create", "update"]
}

# Check token's own capabilities
path "sys/capabilities-self" {
  capabilities = ["create", "update"]
}

# Audit hash
path "sys/audit-hash" {
  capabilities = ["create", "update"]
}

# Health checks
path "sys/health" {
  capabilities = ["read"]
}

# Host info
path "sys/host-info" {
  capabilities = ["read"]
}

# Key Status
path "sys/key-status" {
  capabilities = ["read"]
}

# Leader
path "sys/leader" {
  capabilities = ["read"]
}

# Plugins catalog
path "sys/plugins/catalog/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# List sys/plugins/catalog
path "sys/plugins/catalog" {
  capabilities = ["read"]
}

# Read system configuration state
path "sys/config/state/sanitized" {
  capabilities = ["read"]
}

# Use system tools
path "sys/tools/*" {
  capabilities = ["create", "update"]
}

# Generate OpenAPI docs
path "sys/internal/specs/openapi" {
  capabilities = ["read"]
}

# Lookup leases
path "sys/leases/lookup" {
  capabilities = ["create", "update"]
}

# Renew leases
path "sys/leases/renew" {
  capabilities = ["create", "update"]
}

# Revoke leases
path "sys/leases/revoke" {
  capabilities = ["create", "update"]
}

# Tidy leases
path "sys/leases/tidy" {
  capabilities = ["create", "update"]
}

# Telemetry
path "sys/metrics" {
  capabilities = ["read"]
}

# Seal Vault
path "sys/seal" {
  capabilities = ["create", "update", "sudo"]
}

# Unseal Vault
path "sys/unseal" {
  capabilities = ["create", "update", "sudo"]
}

# Step Down
path "sys/step-down" {
  capabilities = ["create", "update", "sudo"]
}

# Wrapping
path "sys/wrapping/*" {
  capabilities = ["create", "update"]
}

## Enterprise Features

# Manage license
path "sys/license" {
  capabilities = ["create", "read", "update"]
}

# Use control groups
path "sys/control-group/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# MFA
path "sys/mfa/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# List MFA
path "sys/mfa/" {
  capabilities = ["list"]
}

# Namespaces
path "sys/namespaces/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# List sys/namespaces
path "sys/namespaces/" {
  capabilities = ["list"]
}

# Replication
path "sys/replication/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Seal Wrap
path "sys/sealwrap/rewrap" {
  capabilities = ["create", "read", "update"]
}

# KMIP secrets engine
path "kmip/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

################################################################################

# permit access to administer the OIDC auth method
path "oidc/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# permit access to administer the userpass auth method
path "userpass/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}