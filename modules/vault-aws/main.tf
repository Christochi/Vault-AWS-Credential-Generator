resource "vault_aws_secret_backend" "aws" {

    /*
     access_key, secret_key, region can be gotten from environment variable
     or shared credential file if already created
    */
    path = var.mount-path # where aws secret engine will be mounted
    description = "mounts the aws secret engine"
    max_lease_ttl_seconds = 600 # the max cap TTL for credentials
    default_lease_ttl_seconds = 300 # lease duration always < max_lease_ttl_seconds

}

resource "vault_aws_secret_backend_role" "role" {

  # The path the AWS secret backend is mounted at  
  backend = vault_aws_secret_backend.aws.path 

  # name to identify this role within the backend
  name    = var.role-name

  credential_type = "iam_user"

  policy_document = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iam:*", "ec2:*"
      ],
      "Resource": "*"
    }
  ]
}
EOT
}

# generally, these blocks would be in a different module
data "vault_aws_access_credentials" "creds" {

  backend = vault_aws_secret_backend.aws.path
  role    = vault_aws_secret_backend_role.role.name
  
}
