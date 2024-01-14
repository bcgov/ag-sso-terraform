module "EMCOD-HELP-DESK" {
  source                  = "./groups/emcod-help-desk"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "ITSB-ACCESS-TEAM" {
  source                  = "./groups/itsb-access-team"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
  realm-management        = module.realm-management
}
module "PIDP-MANAGEMENT" {
  source                  = "./groups/pidp-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
  realm-management        = module.realm-management
}
module "REGISTRIES-ACCESS-TEAM" {
  source           = "./groups/registries-access-team"
  realm-management = module.realm-management
}
module "SAT-ACCESS-MANAGEMENT" {
  source                  = "./groups/sat-access-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
  realm-management        = module.realm-management
}
module "WEBCAPS-USER-ADMIN" {
  source                  = "./groups/webcaps-user-admin"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
  realm-management        = module.realm-management
}