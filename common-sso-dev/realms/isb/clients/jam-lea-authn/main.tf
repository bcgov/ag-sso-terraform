

resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "PUBLIC"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "jam-lea-authn"
  consent_required                    = false
  description                         = "Law Enforcement Availability Authn Client"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = true
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "jam-lea-authn"
  pkce_code_challenge_method          = ""
  realm_id                            = "ISB"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "https://lea-web-e648d1-dev.apps.emerald.devops.gov.bc.ca*",
    "http://localhost:3000*"
  ]

  web_origins = ["+"]

  // use this to use the IDP stopper theme and assign idir as default scope

  # login_theme = "bcgov-idp-stopper"

  # authentication_flow_binding_overrides {
  #   browser_id = "Idp Stopper"
  # }
}

module "justin_claim" {
  source           = "../../../../../modules/justin-claim-mapper"
  realm_id         = keycloak_openid_client.CLIENT.realm_id
  client_id        = keycloak_openid_client.CLIENT.id
  mapper_name      = "justin-participant"
  client_auth_pass = var.client_auth_pass
  config = {
    "remote.parameters.user.attributes" = "firstname&lastName&email",
    # Additional config settings...
  }
}
# resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
#   realm_id         = keycloak_openid_client.CLIENT.realm_id
#   client_id        = keycloak_openid_client.CLIENT.id

#   default_scopes = [
#     "profile",
#     "email",
#     "roles",
#     "web-origins",
#     "idir"
#   ]
# }
resource "keycloak_openid_user_attribute_protocol_mapper" "user_attribute_mapper" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  name      = "Part Id to Token"

  user_attribute = "partId"
  claim_name     = "partId"
}

module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "agencyDetailGet" = {
      "name" = "agencyDetailGet"
    },
    "agencyDutyTypeDelete" = {
      "name" = "agencyDutyTypeDelete"
    },
    "agencyDutyTypeGet" = {
      "name" = "agencyDutyTypeGet"
    },
    "agencyDutyTypeSave" = {
      "name" = "agencyDutyTypeSave"
    },
    "particAssignmentGet" = {
      "name" = "particAssignmentGet"
    },
  }
}