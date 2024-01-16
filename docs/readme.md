## Workflow

Suraiya, a developer involved in the "Protection Order Registry" project, requires access to DIAM for her application. Here are the steps Suraiya will take:

### Client Creation Workflow:

1. **Fork DIAM IAC Code Base:**
   - Suraiya forks the current DIAM IAC code base from the "main branch."

2. **Local Setup:**
   - On her local machine, Suraiya specifies the realm and environment where she intends to create the client, typically using `ISB` realm.
   - Suraiya creates a client folder within the realm folder, e.g., `jam-por-api`.
   - Using our DIAM-configured module, she adds the Keycloak client Terraform configuration.

3. **Format Terraform Code:**
   - Suraiya ensures the Terraform code is properly formatted by running the formatting command.

4. **Commit Changes:**
   - Suraiya commits her changes in her forked repository.

5. **Create Pull Request (PR):**
   - A PR is created from Suraiya's forked repository to the DIAM IAC main repository.

6. **Request Review:**
   - Suraiya requests a review from a DIAM team member.

7. **Review and Merge:**
   - DIAM team members review Suraiya's proposed changes and merge the request to create her client.

### Client Credential Service Account Workflow:

If Suraiya's client is a Confidential Client and she needs its secret:

1. **Create GitHub Issue:**
   - Suraiya goes to the DIAM IAC code base and creates a GitHub issue using the provided template.

2. **Fill Formatted Information:**
   - In the issue, Suraiya fills out the formatted information:
     - Client-ID: jam-por-api
     - Env: DEV
     - Realm: ISB
     - Email: Suraiya.Khan@gov.bc.ca

3. **Automatic Request Submission:**
   - The issue automatically adds the request to the DIAM request queue and sends a request for approval email to all DIAM team members.

4. **Approval Process:**
   - DIAM team members receive the approval request and review the information.
   - Upon approval, Suraiya receives an email containing the client information, including the secret for her Client Credential Service Account.