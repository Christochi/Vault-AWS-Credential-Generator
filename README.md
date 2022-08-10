# Vault-AWS-Credential-Generator

## Description
Vault generates AWS credentials (with a time-to-live) from Vault's AWS Secrets Engine and Terraform uses the credentials to authenticate and  provision an EC2 instance in AWS. 

The repository comprises 3 directories: **modules, setup and test**

### modules directory
- **aws-ec2 module** contains code for provisioning an EC2 instance in a subnet that already exists in AWS
- **vault-aws module** sets up aws secrets engine and IAM credentials using your aws account and credentials. Terraform automatically fetches them

### setup directory
This is where terraform is called to spin-up infrastructure

### test directory
leverages terratest to execute unit tests on infrastructure code and vault code
check [readme](./test/README.md)

## Requirement
- AWS Account and Credentials
- Vault: Knowledge of AWS Secret Engine
- Terraform

## Outputs
- aws-access-key
- aws-secret-key
- lease-start-time
- lease-ttl
- backend
- role
- subnet-id

## Setup
- aws account and credentials are needed for terraform to provision the infrastructure
- if you have an existing subnet in aws, initialize the variable **subnet-tag** with the tag value of your subnet in **setup/main.tf**

  #### Usage Example
   ~~~
   module "ec2" {

     source = "../modules/aws-ec2"  
     subnet-tag = "eastern-subnet"

   }
   ~~~
   
- set up the dev server. run this command on the cli: `vault server -dev`
- export the **vault address** and **root token** in another terminal taken from the output response of `vault server -dev` cmd:

   - `export VAULT_ADDR` as environment variable
   - `export VAULT_TOKEN` as environment variable

   #### Usage Example
   ~~~
   export VAULT_ADDR='http://127.0.0.1:8200'
   export VAULT_TOKEN='s.GkFZ7.......'
   ~~~

- cd to `setup/`:
   - run `terraform init` cmd
   - run `terraform plan` cmd
   - run `terraform apply` cmd