# COMMON_SSSO_DEV
variable "dev_client_id" {
  description = "The client_id for the Keycloak client"
  default = "service-config"

}

variable "dev_client_secret" {
  description = "The client_secret for the Keycloak client"
  default = "kbQTmwQ6yke1Uo4gcnE1w0Jont9N67sK"
}

variable "dev_keycloak_url" {
  description = "The URL of the Keycloak instance"
  default     = "https://sso-e27db1-dev.apps.gold.devops.gov.bc.ca/auth"
}


# # KEYCLOAK_TEST
# variable "test_client_id" {
#   description = "The client_id for the Keycloak client in Master Realm"
#   default     = "service-config"
# }

# variable "test_client_secret" {
#   description = "The client_secret for the Keycloak client"
# }

# variable "test_keycloak_url" {
#   description = "The URL of the Keycloak instance"
#   default     = "https://test.common-sso.justice.gov.bc.ca"
# }

# # KEYCLOAK_PROD
# variable "prod_client_id" {
#   description = "The client_id for the Keycloak client in Master Realm"
#   default     = "service-config"
# }

# variable "prod_client_secret" {
#   description = "The client_secret for the Keycloak client"
# }

# variable "prod_keycloak_url" {
#   description = "The URL of the Keycloak instance"
#   default     = "https://common-sso.justice.gov.bc.ca"
# }
