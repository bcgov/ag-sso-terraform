

resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "BEARER-ONLY"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "jam-lea-api"
  consent_required                    = false
  description                         = "Law Enforcement Availability API Client"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "jam-lea-api"
  pkce_code_challenge_method          = ""
  realm_id                            = "ISB"
  service_accounts_enabled            = false
  standard_flow_enabled               = false
  use_refresh_tokens                  = true
}
