module "EXTERNAL-READ-ONLY" {
  source           = "./realm-roles/external-read-only"
  realm-management = module.realm-management
}
module "MANAGE-REALM" {
  source           = "./realm-roles/manage-realm"
  realm-management = module.realm-management
}
module "MANAGE-USERS" {
  source                  = "./realm-roles/manage-users"
  USER-MANAGEMENT         = module.USER-MANAGEMENT
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}