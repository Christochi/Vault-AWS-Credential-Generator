variable "ec2-tags" {

  type        = map(string)
  description = "filtering info about the instance"

  default = {

    "name" = "tochi-"

  }

}

variable "instance" {

  type        = string
  description = "virtual server"

  default = "t2.micro"

}

variable "aws-ami" {

  type        = string
  description = "ami name"

  default = "ami-03af6a70ccd8cb578"

}

variable "subnet-tag" {

  type        = string
  description = "tag identifier for the subnet"

  default = "tochi-subnet"

}