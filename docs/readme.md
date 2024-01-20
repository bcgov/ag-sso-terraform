## Workflow

Sam, a developer involved in the `Protection Order Registry` project, requires access to DIAM for her application. Here are the steps Sam will take:

### Client Creation Workflow:

1. **Fork DIAM IAC Code Base:**
   - Sam clones the current DIAM IAC code base from the `main branch.`
   - Sam Create a feature branch from `git checkout -b feature/jam-por-client main`

2. **Local Setup:**
   - On her local machine, Sam specifies the realm and environment where she intends to create the client, typically using `ISB` realm.
   - Sam creates a client folder within the realm folder, e.g., `jam-por-api`.
   - Using our DIAM-configured module, she adds the Keycloak client Terraform configuration.

3. **Format Terraform Code:**
   - Sam ensures the Terraform code is properly formatted by running the formatting command.

4. **Commit Changes:**
   - Sam commits her changes in her forked repository.
   - Sam pushes her feature branch `feature/jam-por-client`

5. **Create Pull Request (PR):**
   - A PR is created from Sam's `feature branch` to the DIAM IAC repository `main` branch.

6. **Request Review:**
   - Sam requests a review from a DIAM team member.

7. **Review and Merge:**
   - DIAM team members review Sam's proposed changes and merge the request to create her client.

### Client Credential Service Account Workflow:

If Sam's client is a Confidential Client and she needs its secret:

1. **Create GitHub Issue:**
   - Sam goes to the DIAM IAC code base and creates a GitHub issue using the provided template.

2. **Fill Formatted Information:**
   - In the issue, Sam fills out the formatted information:
     - Client-ID: jam-por-api
     - Env: DEV
     - Realm: ISB
     - Email: Sam.Khan@gov.bc.ca

3. **Automatic Request Submission:**
   - The issue automatically adds the request to the DIAM request queue and sends a request for approval email to all DIAM team members.

4. **Approval Process:**
   - DIAM team members receive the approval request and review the information.
   - Upon approval, Sam receives an email containing the client information, including the secret for her Client Credential Service Account.
