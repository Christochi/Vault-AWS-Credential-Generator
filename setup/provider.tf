# configure AWS provider
provider "aws" {

  access_key = module.vault-aws.aws-backend-data.access-key # aws access key
  secret_key = module.vault-aws.aws-backend-data.secret-key # aws secret key

  # geographical location infrastructure will be deployed in
  region = var.aws_region

}

# configure Vault provider
provider "vault" {

  # export VAULT_ADDR
  # export VAULT_TOKEN

}
