

module "por-api-client" {
  source      = "../../../../../modules/oidc-client"
  client_id   = "jam-por-api"
  realm_id    = "ISB"
  name        = "jam-por-api"
  description = "Protection Order Registry API"
  access_type = "CONFIDENTIAL"

  valid_redirect_uris = [
    "https://por-api-e648d1-dev.apps.emerald.devops.gov.bc.ca/*",
    "http://localhost:3000*"
  ]

  web_origins = ["+"]
}