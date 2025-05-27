provider "aws" {
    region = var.aws_region
  
}

resource "aws_instance" "ec2" {
    count =5
    ami = var.ami_id["ubuntu"]
    instance_type = var.instance_type
    tags = {
        Name = "multi-ec2-instance-${count.index + 1}"
    }
}    
