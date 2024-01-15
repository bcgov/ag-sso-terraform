output "CLIENT" {
  value = keycloak_openid_client.CLIENT
}
output "client_secret" {
  value = keycloak_openid_client.CLIENT.client_secret

  description = "The secret for keyclaok client."
  sensitive   = true
}