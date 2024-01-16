

module "TOMCAT_OIDC_CLIENT" {
  source      = "../../../../../modules/oidc-client"
  client_id   = "tomcat-client"
  realm_id    = "ISBB"
  name        = "tomcat-client"
  description = "Tomcat OIDC Client for ORDS"
  access_type = "CONFIDENTIAL"
}