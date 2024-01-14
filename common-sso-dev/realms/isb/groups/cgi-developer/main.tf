resource "keycloak_group" "GROUP" {
  realm_id = "ISB"
  name     = "CGI Developer"
}

resource "keycloak_group_roles" "GROUP_ROLES" {
  realm_id = keycloak_group.GROUP.realm_id
  group_id = keycloak_group.GROUP.id

  role_ids = [
    var.CGI-APPLICATION-SUPPORT.REALM_ROLE.id,
    var.HEM.ROLES["hem"].id,
    var.MANAGE-USERS.REALM_ROLE.id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-metrics"].id
  ]
}
