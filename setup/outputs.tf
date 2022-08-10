# output access key, secret key, lease ttl, lease start time
output "aws-backend" {

  value = module.vault-aws.aws-backend-data

}

# output aws secret backend and iam role
output "secret-backend" {

  value = module.vault-aws.secret-backend-data

}

# output subnet-id
output "subnet-data" {

  value = module.ec2.subnet-data

}