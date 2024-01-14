

resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "DMFT-SERVICE"
  consent_required                    = false
  description                         = "Driver Medical Fitness Transformation"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "DMFT"
  pkce_code_challenge_method          = ""
  realm_id                            = "ISB"
  service_accounts_enabled            = true
  standard_flow_enabled               = false
  use_refresh_tokens                  = true
}

module "justin_claim" {
  source = "../../../../../modules/justin-claim-mapper"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  mapper_name  = "justin-participant"
  client_auth_pass = var.client_auth_pass
  config = {
    "remote.parameters.user.attributes" = "firstname&lastName&email",
    # Additional config settings...
  }
}
module "scope-mappings" {
  source    = "../../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "PIDP-SERVICE/view_endorsement_data" = var.PIDP-SERVICE.ROLES["view_endorsement_data"].id,
  }
}
module "service-account-roles" {
  source                  = "../../../../../modules/service-account-roles"
  realm_id                = keycloak_openid_client.CLIENT.realm_id
  client_id               = keycloak_openid_client.CLIENT.id
  service_account_user_id = keycloak_openid_client.CLIENT.service_account_user_id
  realm_roles = {
    "default-roles-isb" = "default-roles-isb",
  }
  client_roles = {
    "PIDP-SERVICE/view_endorsement_data" = {
      "client_id" = var.PIDP-SERVICE.CLIENT.id,
      "role_id"   = "view_endorsement_data"
    }
  }
}
