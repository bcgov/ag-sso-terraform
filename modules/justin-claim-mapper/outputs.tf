# modules/keycloak-generic-mapper/outputs.tf

output "mapper_id" {
  description = "The ID of the created protocol mapper"
  value       = keycloak_generic_protocol_mapper.justin_claim_mapper.id
}
