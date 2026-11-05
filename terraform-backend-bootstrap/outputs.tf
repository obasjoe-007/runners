output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.devsecops_test.id
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.devsecops_test.private_ip
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.devsecops_test.public_ip
}

output "ami_id" {
  description = "AMI used to create the EC2 instance"
  value       = data.aws_ami.amazon_linux.id
}

##Obasjoe in the house
output "aws_region" {
  description = "AWS region where the instance was created"
  value       = var.aws_region
}
