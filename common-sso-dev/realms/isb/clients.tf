module "account" {
  source = "../../../modules/account"
}
module "realm-management" {
  source = "../../../modules/realm-management"
}
module "CONNECT" {
  source = "./clients/connect"
}
module "DMFT-SERVICE" {
  source           = "./clients/dmft-service"
  PIDP-SERVICE     = module.PIDP-SERVICE
  client_auth_pass = var.client_auth_pass
}
module "USER-MANAGEMENT-SERVICE" {
  source            = "./clients/user-management-service"
  realm-management  = module.realm-management
  account           = module.account
  ORGANIZATIONS-API = module.ORGANIZATIONS-API
  MSPDIRECT-SERVICE = module.MSPDIRECT-SERVICE
}
module "ORGANIZATIONS-API" {
  source = "./clients/organizations-api"
}
module "MSPDIRECT-SERVICE" {
  source = "./clients/mspdirect-service"
}
module "USER-MANAGEMENT" {
  source                  = "./clients/user-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "DMFT-WEBAPP" {
  source         = "./clients/dmft-webapp"
  LICENCE-STATUS = module.LICENCE-STATUS
}
module "PIDP-SERVICE-ACCOUNT" {
  source = "./clients/pidp-service-account"
}
module "PIDP-WEBAPP" {
  source       = "./clients/pidp-webapp"
  account      = module.account
  PIDP-SERVICE = module.PIDP-SERVICE
}
module "terraform" {
  source           = "./clients/terraform"
  realm-management = module.realm-management
}
module "LICENCE-STATUS" {
  source = "./clients/licence-status"
}
module "PIDP-SERVICE" {
  source                  = "./clients/pidp-service"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "JAM-LEA-AUTHN" {
  source           = "./clients/jam-lea-authn"
  client_auth_pass = var.client_auth_pass
}
module "JAM-LEA-DAL" {
  source           = "./clients/jam-lea-dal"
  client_auth_pass = var.client_auth_pass
}
module "JAM-LEA-API" {
  source = "./clients/jam-lea-api"
}
module "JAM-POR" {
  source           = "./clients/jam-por"
  client_auth_pass = var.client_auth_pass
}
module "ORDS-TOMCAT-CLIENT" {
  source = "./clients/tomcat-client"
}
module "JAM-POR-API-CLIENT" {
  source = "./clients/jam-por-api"
}