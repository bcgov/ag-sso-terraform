

module "TOMCAT_OIDC_CLIENT" {
  source      = "../../../../../modules/oidc-client"
  client_id   = "ords-tomcat-client"
  realm_id    = "ISB"
  name        = "tomcat-client"
  description = "Tomcat OIDC Client for ORDS"
  access_type = "CONFIDENTIAL"
}