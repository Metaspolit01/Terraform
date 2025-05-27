resource "aws_launch_template" "template" {
  name           = "karthik-template"
  image_id       = var.ami_id["ubuntu"]
  instance_type  = var.instance_type
  key_name       = "terraform"
}

resource "aws_autoscaling_group" "asg" {
  name                      = "karthik-asg"
  desired_capacity          = 3
  max_size                  = 5
  min_size                  = 2
  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.template.id
    version = aws_launch_template.template.latest_version
  }

  vpc_zone_identifier = [aws_subnet.private_1.id, aws_subnet.private_2.id]
  target_group_arns   = [aws_lb_target_group.tg.arn]

  tag {
    key                 = "Name"
    value               = "karthik-asg"
    propagate_at_launch = true
  }
}
