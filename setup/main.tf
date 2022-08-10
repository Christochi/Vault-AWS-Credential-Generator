# compile aws-ec2
module "ec2" {

  source = "../modules/aws-ec2"  
  subnet-tag = "tochi-subnet"

}

# compile vault-aws
module "vault-aws" {

  source = "../modules/vault-aws"

}
