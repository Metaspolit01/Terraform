resource "aws_launch_template" "template" {
    name = "karthik-template"
    image_id = "var.ami_id[ubuntu]"
    instance_type = var.instance_type
    key_name = ec2-multiple.pem
    
    


  
}