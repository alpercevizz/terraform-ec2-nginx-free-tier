output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = try(aws_instance.web_server.public_ip, "Not yet created")
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = try(aws_instance.web_server.id, "Not yet created")
}

output "instance_ami" {
  description = "The AMI used for the EC2 instance"
  value       = try(aws_instance.web_server.ami, "Not yet created")
}
