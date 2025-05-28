variable "aws_region" {

  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"

}

variable "ami_id"  {

  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0c02fb55956c7d316"

}

variable "key_name"  {

  description = "Name of the existing SSH key pair in AWS"
  type        = string

}

