# Terraform-Vault-AWS
## Description
Terraform generates AWS credentials from Vault aws secrets engine and uses those credentials to authenticate and  provision an EC2 instance in AWS.

The Terraform configuration comprises 2 sub-directories: modules and setup

### modules
- **aws-ec2 module** contains code for provisioning an EC2 instance in subnet. You will have to tweak the code for the subnet
- **vault-aws module** sets up aws secrets engine and iam credentials

### setup
root module resides here, including other configuration files

## Setup
- tweak subnet code
- set up the dev server: `vault server -dev`
- include in the CLI:
   - `export VAULT_ADDR` environment variable
   - `export VAULT_TOKEN` environment variable
- go to `setup/`:
   - run `terraform init` cmd
   - run `terraform plan` cmd
   - run `terraform apply` cmd