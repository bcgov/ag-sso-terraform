### Changes being made

Please include a short summary of the change.

### Context

What is the context for those changes? For example: particular role needs to be shown in token. Reference Azure Board task, if applicable.

### Quality Check

- [ ] Client has Name and Description defined.
- [ ] Full Scope Allowed is disabled.
- [ ] Direct Access Grants Enabled is disabled.
- [ ] Valid Redirect URIs are properly defined, or explanation for `*` (allow all) is provided.
- [ ] Web Origins are set to `+` instead of `*` to restrict the CORS origins.
- [ ] Client Scopes are not assigned to client, or explanation for doing so is provided. [^1]
- [ ] Client module and all references are defined in clients.tf in realm root folder. Same rule applies to other resources, like groups and realm roles.
- [ ] Terraform plan contains only my changes, or other developers are aware that their manual changes can be overridden. [^2]
- [ ] [CMDB](https://servicenow.justice.gov.bc.ca/cmdbuildProd/ui/#classes/Application/cards) is updated, if applicable.
- [ ] When updating `composite roles` (eg. Realm roles) and `scope mapping` resources, remember to re-run the apply. [^3]

[^1]: Data transparency. Does the client you are creating have the permissions to pass/access all the Client Scope attributes in the token? For example `profile` scope includes user birthdate, which is used by BCSC, but other applications shouldn't necessarily have access to it.
[^2]:
    Keep in mind that sometimes Keycloak automatically adds properties to newly created resources. `terraform plan` will show them as changes made outside of Terraform. As long as those attributes are empty and do not interfere with existing configuration, they can be ignored. Here is example of one:
    ![Terraform](https://user-images.githubusercontent.com/52381251/236051457-cdf91ff2-adc1-4ec0-b648-bfbcd7c55198.png)

[^3]: Due to the terraform provider bug, updating/deleting one entry within the resource deletes all of them. Re-running the `apply` action will result in restoring the configuration to the desired state. Keep in mind, that `composite role` deletion will show up on the `terraform plan` output, on contrary to `scope mapping`.
