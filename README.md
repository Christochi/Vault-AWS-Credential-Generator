# Vault-AWS-Credential-Generator

## Description
Vault generates AWS credentials (with a time-to-live) from Vault's AWS Secrets Engine and Terraform uses the credentials to authenticate and  provision an EC2 instance in AWS. 

The repository comprises 3 directories: **modules, setup and test**

### modules directory
- **aws-ec2 module** contains code for provisioning an EC2 instance in a subnet that already exists in AWS. You will have to tweak the code for the subnet
- **vault-aws module** sets up aws secrets engine and IAM credentials using your aws account and credentials. Terraform automatically fetches them

### setup directory
This is where terraform is called to spin-up infrastructure

## Setup
- aws account and credentials are needed for terraform to provision the infrastructure
- tweak subnet code in **modules/aws-ec2/main.tf**
- set up the dev server: `vault server -dev`
- export these vars in the CLI taken from the output response of `vault server -dev` cmd:
   - `export VAULT_ADDR` as environment variable
   - `export VAULT_TOKEN` as environment variable

   #### Usage Example
   ~~~
   client-id             = "c5bgyg0-575-....."
   client-secret         = "AdCD419~F...."
   subscription-id       = "c4774376-......"
   tenant-id             = "b9rc7889-....."
   az_image_name         = "your-custom-image-name"
   managed-image-rg-name = "your-resource-group" # not parker created
   ~~~
   
- cd to `setup/`:
   - run `terraform init` cmd
   - run `terraform plan` cmd
   - run `terraform apply` cmd