resource "aws_lb" "lb" {
    name              = "my-load-balancer"
    internal          = false
    load_balancer_type = "application"
    security_groups   = [aws_security_group.security.id]
    subnets           = [aws_subnet.pub1.id, aws_subnet.pub2.id]
    tags = {
        Name = "my-load-balancer"
    }

  
}
resource "aws_lb_target_group" "tg" {
    name     = "my-target-group"
    port     = 80
    protocol = "HTTP"
    vpc_id   = aws_vpc.main.id
}
resource "aws_lb_listener" "listener" {
    load_balancer_arn = aws_lb.lb.arn
    port              = 80
    protocol          = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.tg.arn
    }
}
