variable "realm_id" {
  description = "The realm this client is attached to."
}

variable "client_id" {
  description = "The Client ID for this client, referenced in the URI during authentication and in issued tokens."
}

variable "client_name" {
  description = "The display name of this client in the GUI."
  default     = ""
}

variable "enabled" {
  description = "When false, this client will not be able to initiate a login or obtain access tokens."
  type        = bool
  default     = true
}

variable "description" {
  description = "The description of this client in the GUI."
  default     = "Created without CSS app"
}

# CONFIDENTIAL - Used for server-side clients that require both client ID and secret when authenticating.
#                This client should be used for applications using the Authorization Code or Client Credentials grant flows.
# PUBLIC - Used for browser-only applications that do not require a client secret, and instead rely only on authorized redirect URIs for security.
#          This client should be used for applications using the Implicit grant flow.
# BEARER-ONLY - Used for services that never initiate a login. This client will only allow bearer token requests.
variable "access_type" {
  description = "The access type of the openid client."
  default     = "CONFIDENTIAL"
}

#  This value is sensitive and should be treated with the same care as a password. If omitted, this will be generated by Keycloak.
variable "client_secret" {
  description = "The secret for clients with an access_type of CONFIDENTIAL or BEARER-ONLY."
  default     = ""
}

variable "standard_flow_enabled" {
  description = "When true, the OAuth2 Authorization Code Grant will be enabled for this client."
  type        = bool
  default     = true
}

variable "implicit_flow_enabled" {
  description = "When true, the OAuth2 Implicit Grant will be enabled for this client."
  type        = bool
  default     = false
}

variable "direct_access_grants_enabled" {
  description = "When true, the OAuth2 Resource Owner Password Grant will be enabled for this client."
  type        = bool
  default     = false
}

# This feature is only available for confidential clients
# 1. if access_type == CONFIDENTIAL => Valid
# 2. if access_type == PUBLIC => Invalid; service accounts (client credentials flow) cannot be enabled on public clients
# 3. if access_type == BEARER-ONLY => Invalid; Keycloak cannot issue tokens for bearer-only clients
variable "service_accounts_enabled" {
  description = "When true, the OAuth2 Client Credentials grant will be enabled for this client."
  type        = bool
  default     = false
}

# This attribute must be set if either standard_flow_enabled or implicit_flow_enabled is set to true
variable "valid_redirect_uris" {
  description = "A list of valid URIs a browser is permitted to redirect to after a successful login or logout."
  type        = list(string)
  default     = ["*"]
}

# + can be used to permit all valid redirect URIs, and * can be used to permit all origins.
variable "web_origins" {
  description = "A list of allowed CORS origins."
  type        = list(string)
  default     = []
}

variable "pkce_code_challenge_method" {
  description = "The challenge method to use for Proof Key for Code Exchange. Can be either plain or S256 or set to empty value."
  default     = ""
}

variable "access_token_lifespan" {
  description = "The amount of time in seconds before an access token expires. This will override the default for the realm."
  default     = ""
}

variable "client_offline_session_idle_timeout" {
  description = "Time a client session is allowed to be idle before it expires. Tokens are invalidated when a client session is expired. If not set it uses the standard SSO Session Idle value."
  default     = ""
}

variable "client_offline_session_max_lifespan" {
  description = "Max time before a client session is expired. Tokens are invalidated when a client session is expired. If not set, it uses the standard SSO Session Max value."
  default     = ""
}

variable "client_session_idle_timeout" {
  description = "Time a client offline session is allowed to be idle before it expires. Offline tokens are invalidated when a client offline session is expired. If not set it uses the Offline Session Idle value."
  default     = ""
}

variable "client_session_max_lifespan" {
  description = "Max time before a client offline session is expired. Offline tokens are invalidated when a client offline session is expired. If not set, it uses the Offline Session Max value."
  default     = ""
}

variable "login_theme" {
  description = "The client login theme. This will override the default theme for the realm."
  default     = ""
}

variable "roles" {
  description = "Client roles to create in the openid client of the realm."
  type        = list(string)
  default     = []
}

variable "idps" {
  description = "Identity Providers; assign each as a client scope."
  type        = list(string)
  default     = []
}

variable "override_authentication_flow" {
  description = "Set to true when either of 'browser_authentication_flow' or 'direct_grant_authentication_flow' has value(s)."
  type        = bool
  default     = false
}

variable "browser_authentication_flow" {
  description = "Authentication browser flow id."
  default     = ""
}

variable "direct_grant_authentication_flow" {
  description = "Authentication direct grant flow id."
  default     = ""
}

variable "additional_role_attribute" {
  description = "Additional role ttribute to have the client roles"
  default     = ""
}