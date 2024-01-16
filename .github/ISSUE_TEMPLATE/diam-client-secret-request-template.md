---
name: DIAM Client Secret Request Template
about: This template is use to request your keycloak client installation information
title: DIAM Keycloak Client Secret for {{ YOUR_CLIENT_NAME }}
labels: client secret, help wanted
assignees: leewrigh, rloisell, sookeke

---

***Mandatory fields are as follows:***

client-id: ${{ YOUR_DIAM_CLIENT_NAME }}
env: ${{ DIAM_ENV (DEV or TEST or PROD}} 
realm: ${{ DIAM_REALM }}
email: ${{ YOUR_GOV_EMAIL }}
