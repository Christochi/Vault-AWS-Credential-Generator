# output aws secret backend and iam role
output "secret-backend-data" {

  value = {

    backend = vault_aws_secret_backend.aws.path
    role    = vault_aws_secret_backend_role.role.name

  }

}

# output access key, secret key, lease ttl, lease start time
output "aws-backend-data" {

  value = {

    access-key       = data.vault_aws_access_credentials.creds.access_key
    secret-key       = data.vault_aws_access_credentials.creds.secret_key
    lease-ttl        = data.vault_aws_access_credentials.creds.lease_duration
    lease-start-time = data.vault_aws_access_credentials.creds.lease_start_time

  }
}