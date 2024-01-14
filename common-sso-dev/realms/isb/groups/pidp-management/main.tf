resource "keycloak_group" "GROUP" {
  realm_id = "ISB"
  name     = "PIdP Management"
}

resource "keycloak_group_roles" "GROUP_ROLES" {
  realm_id = keycloak_group.GROUP.realm_id
  group_id = keycloak_group.GROUP.id

  role_ids = [
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-own-groups"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-roles"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-dmft-webapp"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-licence-status"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-pidp-service"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-clients"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-events"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-groups"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-users"].id,
    var.realm-management.ROLES["query-clients"].id,
    var.realm-management.ROLES["view-clients"].id
  ]
}
