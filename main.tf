terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 4.0.0"
    }
  }
  required_version = "~> 1.6.6"

  backend "s3" {
    bucket                      = "common-sso-state"
    key                         = "common-sso.tfstate"
    region                      = "myregion"
    access_key                  = "xxxxx" # optional if using environment variables or IAM roles
    secret_key                  = "xxxx"  # optional if using environment variables or IAM roles
    endpoints                   = { s3 = "https://s3-e84410-dev.apps.gold.devops.gov.bc.ca" }
    skip_region_validation      = true
    encrypt                     = false
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    use_path_style              = true
    skip_s3_checksum            = true
  }
}

module "COMMON_SSO_DEV" {
  source = "./common-sso-dev"


  client_id        = var.dev_client_id
  client_secret    = var.dev_client_secret
  keycloak_url     = var.dev_keycloak_url
  client_auth_pass = var.client_auth_pass
}

# module "COMMON_SSO_TEST" {
#   source = "./common-sso-test"

#   client_id     = var.test_client_id
#   client_secret = var.test_client_secret
#   keycloak_url  = var.test_keycloak_url
# }

# module "COMMON_SSO_PROD" {
#   source = "./common-sso-prod"

#   client_id     = var.prod_client_id
#   client_secret = var.prod_client_secret
#   keycloak_url  = var.prod_keycloak_url
# }