variable "ami_id" {
  description = "The AMI ID to use for the EC2 instances"
  type        = map(string)
  default = {
    "amazon-linux" = "ami-0953476d60561c955"
    "ubuntu" = "ami-084568db4383264d4"
    "windows" = "ami-0fa71268a899c2733"
  }
  
}

variable "instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t3.micro"
  
}


variable "aws_region" {
  description = "The AWS region to deploy the EC2 instances in"
  type        = string
  default     = "us-east-1"
  
}