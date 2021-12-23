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

variable "aws_ami" {

  type        = string
  description = "ami name"

  default = "ami-03af6a70ccd8cb578"

}