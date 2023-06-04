# Accuknox Terraform Problem Statement

This repo contains Terraform code to provision two ec2 instances into two different aws regions using the same terraform code:

Regions: us-east-1, us-east-2
## Implementation Notes:

- State Management is done using AWS S3 as the backend with DynamoDb locking.
- Two providers have been declared in the providers.tf file with the respective alias so that their selection can be done from modules/resources.  
- for_each/count couldn't be used for modules/resources at the top level as the "provider" config block within the module/resource block doesn't allow for_each/count, yet. It only accepts static value. There is an open feature request for the same: https://github.com/hashicorp/terraform/issues/24476
- Hence, two seperate module/resource declerations have been done and they are correctly using the right providers in order to provision resources in us-east-1 and us-east-2 regions.
- AWS Credentials need to be set by exporting the AWS_PROFILE variable in the shell from where terraform will execute. 
- terraform.tfvars was pushed to git because it doesn't contain any sensitive data, yet. If any sensitive data required to passed as variables then instead of terraform.tfvars environment variables could be used.

Thanks!