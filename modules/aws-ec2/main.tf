# fetch subnet in the region that has that tag name
data "aws_subnet" "west-subnet" {

  filter {

    name   = "tag:Name"
    values = ["tochi-subnet"]

  }

}

# create EC2 instance
resource "aws_instance" "server" {

  ami           = var.aws-ami # ami in us-west-1
  instance_type = var.instance

  # subnet_id = var.subnet # VPC subnet ID to launch EC2 instance
  subnet_id = data.aws_subnet.west-subnet.id

  tags = {

    Name = "${var.ec2-tags.name}instance"
  }
}