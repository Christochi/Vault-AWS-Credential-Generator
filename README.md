# Vault-AWS-Credential-Generator

## Description
Vault generates AWS credentials (with a time-to-live) from Vault's AWS Secrets Engine and Terraform uses the credentials to authenticate and  provision an EC2 instance in AWS. 

The repository comprises 3 directories: **modules, setup and test**

### modules directory
- **aws-ec2 module** contains code for provisioning an EC2 instance in a subnet that already exists in AWS. You will have to tweak the code for the subnet
- **vault-aws module** sets up aws secrets engine and IAM credentials

### setup directory
This is where terraform is called to spin-up infrastructure

## Setup
- tweak subnet code in **modules/aws-ec2/main.tf**
- set up the dev server: `vault server -dev`
- include in the CLI:
   - `export VAULT_ADDR` as environment variable
   - `export VAULT_TOKEN` as environment variable
- cd to `setup/`:
   - run `terraform init` cmd
   - run `terraform plan` cmd
   - run `terraform apply` cmd