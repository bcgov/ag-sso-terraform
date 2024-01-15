terraform {
  required_version = "~> 1.6.6"

  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">=3.8.1"
    }
  }
}
