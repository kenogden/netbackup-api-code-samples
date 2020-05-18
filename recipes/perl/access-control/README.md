### NetBackup API Code Examples for Perl

This directory contains code samples for converting rbac principals behind registered API Keys.

#### Disclaimer

These scripts are only meant to be used as reference. They are not intended to be used in production environment.

#### Pre-requisites

- NetBackup 8.3 or higher
- Perl 5.20.2 or higher

#### Executing the recipes in Perl

Use the following command to get rbac principals behind registered API Keys, existing roles for rbac gen1 roles, and creating new access control roles accordingly.

- `perl list_api_keys -hostname <hostname> -username <username> -password <password> [-domain_name <domain_name>] [-domain_type <domain_type>]` 

- `perl list_gen1_roles -hostname <hostname> -username <username> -password <password> [-domain_name <domain_name>] [-domain_type <domain_type>]` 

- `perl create_access_control_role -hostname <hostname> -username <username> -password <password> -role_name <role_name> [-role_description <role_description>] [-domain_name <domain_name>] [-domain_type <domain_type>]` 
