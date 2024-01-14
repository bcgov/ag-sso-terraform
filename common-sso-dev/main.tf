terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 4.0.0"
    }
  }
}

module "ISB" {
  source           = "./realms/isb"
  client_auth_pass = var.client_auth_pass
}

provider "keycloak" {
  realm         = "master"
  client_id     = var.client_id
  client_secret = var.client_secret
  url           = var.keycloak_url
}