terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 4.0.0"
    }
  }
}

module "ISB" {
  source                  = "./realms/isb"
  client_auth_pass        = var.client_auth_pass
  azure_alias             = var.azure_alias
  azure_authorization_url = var.azure_authorization_url
  azure_token_url         = var.azure_token_url
  azure_client_id         = var.azure_client_id
  azure_client_secret     = var.azure_client_secret
}

provider "keycloak" {
  realm         = "master"
  client_id     = var.client_id
  client_secret = var.client_secret
  url           = var.keycloak_url
}