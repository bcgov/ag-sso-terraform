terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 4.0.0"
    }
  }
}



resource "keycloak_generic_protocol_mapper" "justin_claim_mapper" {
  realm_id        = var.realm_id
  client_id       = var.client_id
  name            = var.mapper_name
  protocol        = var.protocol
  protocol_mapper = "json-remote-claim"
  config = merge(var.config, {
    "remote.parameters.user.attributes" = "firstname&lastName",
    "remote.url"                        = var.remote_url,
    "remote.parameters.clientid"        = "false",
    "client.auth.url"                   = var.client_auth_url,
    "access.token.claim"                = "true",
    "remote.headers.bearer.token"       = "true",
    "remote.request.retry"              = "true",
    "debugging.remote.disabled"         = "true",
    "userinfo.token.claim"              = "true",
    "id.token.claim"                    = "true",
    "remote.parameters.username"        = "true",
    "claim.name"                        = "justin:participant",
    "client.auth.pass"                  = var.client_auth_pass,
    "client.auth.id"                    = var.client_auth_id,
  })
}
