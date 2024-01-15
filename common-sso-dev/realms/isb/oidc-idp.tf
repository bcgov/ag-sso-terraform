module "azure" {
  source = "../../../modules/oidc-idp"

  token_url         = var.azure_token_url
  client_id         = var.azure_client_id
  client_secret     = var.azure_client_secret
  realm_id          = "ISB"
  authorization_url = var.azure_authorization_url
  alias             = var.azure_alias
  display_name      = "Azure"

}
// add more oidc IDPs on this realm if needed