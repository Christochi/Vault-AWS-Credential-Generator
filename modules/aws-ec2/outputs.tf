output "subnet-data" {

  value       = data.aws_subnet.west-subnet.id
  description = "print subnet id"

}