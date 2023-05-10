

# create internet facing application loadbalancer
# define a data block to fetch a list of the EC2 instance in a running state.
# data "aws_instances" "ec2_list" {
#   instance_state_names = ["running"]
# }

resource "aws_alb" "internet_facing_lb" {
  name = "externalalp"
  internal                         = false
  load_balancer_type               = "application"
  security_groups                  = [var.internetfacing_lb_sg]
  subnets                          = var.public_subnets
  enable_cross_zone_load_balancing = "true"
  tags = {
    Name = "external-ALB"
  }
}

resource "aws_lb_target_group" "front_end" {
  name = "external-tg"
  vpc_id      = var.vpc_ref
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  health_check {
    timeout             = 10
    interval            = 30
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }
  tags = {
    "Name" = "external-tg"
  }
}

resource "aws_lb_target_group_attachment" "attatch_nginx" {
  count = 2
  target_group_arn = aws_lb_target_group.front_end.id
  target_id        = var.nginx_server[count.index]
  port             = 80
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_alb.internet_facing_lb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end.arn
  }
}

# create internal load balancer for private instances

resource "aws_alb" "internal_alb" {
  name = "internalalb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.internal_alb_sg]
  subnets            = var.private_subnets
  enable_cross_zone_load_balancing = "true"
  tags = {
    Name = "internal-ALB"
  }

}

resource "aws_lb_target_group" "private_tg" {
  vpc_id      = var.vpc_ref
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  health_check {
    timeout             = 10
    interval            = 30
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }
}

resource "aws_alb_target_group_attachment" "apache_a_attach" {
  count = 2
  target_group_arn = aws_lb_target_group.private_tg.id
  target_id        = var.apache_server[count.index]
  port             = 80
}

resource "aws_lb_listener" "backend" {
  load_balancer_arn = aws_alb.internal_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private_tg.arn
  }
}