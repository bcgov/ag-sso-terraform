variable "client_id" {
  description = "The client_id for the Keycloak client in Master Realm"
}

variable "client_secret" {
  description = "The client_secret for the Keycloak client"
}

variable "keycloak_url" {
  description = "The URL of the Keycloak instance"
}
variable "client_auth_pass" {
  type = string
  //default = "default_value" # Set a default value or replace with your actual default value
}