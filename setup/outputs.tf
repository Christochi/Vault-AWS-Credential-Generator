# output access key, secret key, lease ttl, lease start time
output "aws-backend" {

    value = module.vault-aws.aws-backend-data

}

# output backend and role
output "secret-backend" {

    value = module.vault-aws.secret-backend-data
    
}
