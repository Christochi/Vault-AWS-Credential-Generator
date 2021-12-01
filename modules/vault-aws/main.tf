resource "vault_aws_secret_backend" "aws" {

    /*
     access_key, secret_key, region can be gotten from environment variable
     or shared credential file if already created
    */
    path = var.mount-path # where aws secret engine will be mounted
    description = "mounts the aws secret engine"
    # max_lease_ttl_seconds = 120 # lease duration
    default_lease_ttl_seconds = 60 # lease duration

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
      "Action": "ec2:*",
      "Resource": "*"
    }
  ]
}
EOT
}