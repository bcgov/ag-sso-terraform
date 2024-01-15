#!/bin/bash

# Check if required tools are installed
if ! command -v curl &> /dev/null; then
    echo "Please install curl before running this script."
    exit 1
fi

if ! command -v jq &> /dev/null; then
    echo "Please install jq before running this script."
    exit 1
fi

# Function to get bearer token
function get_bearer_token() {
    local oidc_token_endpoint="auth/realms/master/protocol/openid-connect/token"
    local username="service-config"

    local response=$(curl -s -w '%{http_code}' -X POST https://${keycloak_host}/${oidc_token_endpoint} \
        -H 'Content-Type: application/x-www-form-urlencoded' \
        -H "Accept: application/json" \
        -d client_id="${username}" \
        -d client_secret="${password}" \
        -d grant_type=client_credentials)

    local http_code=${response: -3}

    if check_http_response_code ${http_code}; then
        local content=$(strip_http_code "${response}" | jq -r .access_token)
        echo -n ${content}
    fi
}

# Function to check HTTP response code
function check_http_response_code() {
    local http_code=$1
    if [ ${http_code} -ne 200 ]; then
        echo "Invalid http_code: ${http_code}."
        exit 1
    fi
}

# Function to strip HTTP code
function strip_http_code() {
    response=$1
    echo "${response}" | head -c-4
}

function get_client_installation() {

    local bearer_token=$(get_bearer_token)
 
    local client_id=$(get_client_id)
    local installation_endpoint="auth/admin/realms/${realm}/clients/${client_id}/installation/providers/keycloak-oidc-keycloak-json"
    local response=$(curl -s -w '%{http_code}' -X GET https://${keycloak_host}/${installation_endpoint} \
        -H 'Content-Type: application/json' \
        -H "Authorization: bearer ${bearer_token}")
    local http_code=${response: -3}

    if check_http_response_code ${http_code}; then
        local content=$(strip_http_code "${response}")
        echo -n ${content}
    fi
}
function get_client_id() {
  local clients_endpoint="auth/admin/realms/${realm}/clients"
  local response=$(curl -s -w '%{http_code}' -X GET https://${keycloak_host}/${clients_endpoint} \
    -H 'Content-Type: application/json' \
    -H "Authorization: bearer ${bearer_token}")
  local http_code=${response: -3}

  if check_http_response_code ${http_code}; then
    local content=$(strip_http_code "${response}" \
      | jq -r --arg client_id "${client_id}" '.[] | select(.clientId == $client_id) | .id')
    echo -n ${content}
  fi
}
function get_client_secret() {
  local bearer_token=$(get_bearer_token)
 
  local client_id=$(get_client_id)
  echo "client id is $client_id"
  local client_secret_endpoint="auth/admin/realms/${realm}/clients/${client_id}/client-secret"
  local response=$(curl -s -w '%{http_code}' -X GET https://${keycloak_host}/${client_secret_endpoint} \
    -H 'Content-Type: application/json' \
    -H "Authorization: bearer ${bearer_token}")
  local http_code=${response: -3}

  if check_http_response_code ${http_code}; then
    local content=$(strip_http_code "${response}" | jq -r .value)
    echo -n ${content}
  fi
}

# Check if required arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <client_id> <env> <realm>"
    exit 1
fi

# Set Keycloak service base URL based on the environment
case "$2" in
    "dev")
        keycloak_host="sso-e27db1-dev.apps.gold.devops.gov.bc.ca"
        password="$TF_VAR_PROD_CLIENT_SECRET"
        ;;
    "prod")
        keycloak_host="sso-e27db1-dev.apps.gold.devops.gov.bc.ca"
        password="$TF_VAR_PROD_CLIENT_SECRET"
        ;;
    *)
        echo "Invalid environment. Supported environments: dev, prod."
        exit 1
        ;;
esac

# Keycloak realm
realm="$3"

# Keycloak client ID
client_id="$1"



# Get the bearer token
client_installation=$(get_client_installation)
echo $client_installation

#echo "Client Secret for client ${client_id} in realm ${realm}: ${client_secret}"