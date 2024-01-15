# modules/keycloak-generic-mapper/variables.tf

variable "realm_id" {
  description = "The ID of the Keycloak realm"
  type        = string
}

variable "client_id" {
  description = "The ID of the Keycloak client"
  type        = string
}

variable "mapper_name" {
  description = "Name of the protocol mapper"
  type        = string
  default     = "justin-participant"
}

variable "protocol" {
  description = "Protocol for the protocol mapper"
  type        = string
  default     = "openid-connect"
}

variable "config" {
  description = "Configuration for the protocol mapper"
  type        = map(string)
}

variable "remote_url" {
  description = "URL for the remote claim API"
  type        = string
  default     = "https://custom-claim-api-e648d1-dev.apps.emerald.devops.gov.bc.ca/api/participant"
}

variable "client_auth_url" {
  description = "URL for client authentication"
  type        = string
  default     = "https://sso-e27db1-dev.apps.gold.devops.gov.bc.ca/auth/realms/DEMS/protocol/openid-connect/token"
}

variable "client_auth_id" {
  description = "Client ID for client authentication"
  type        = string
  default     = "justin-participant-client"
}

variable "client_auth_pass" {
  description = "Client secret or password for client authentication"
  type        = string
}