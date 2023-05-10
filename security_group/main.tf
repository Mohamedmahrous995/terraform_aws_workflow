# internetfacing load balancer security group 
resource "aws_security_group" "internetfacing_alb_sg" {
  vpc_id = var.vpc_ref
  name = "internetfacing_alb_sg"
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow http port"
    from_port   = var.alb_internetfacing_port
    to_port     = var.alb_internetfacing_port
    protocol    = "tcp"

  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all trafic in the outbound rule"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
  egress {
    security_groups =  [aws_security_group.public_instance_sg.id]
    description = "allow all trafic in the outbound rule"
    from_port   = var.alb_internetfacing_port
    to_port     = var.alb_internetfacing_port
    protocol    = "tcp"
  }
   tags = {
    Name: "internetfacing_alb_sg"
  }
}


# create security group to public subnet
resource "aws_security_group" "public_instance_sg" {
  name = "public_instance_sg"
  vpc_id = var.vpc_ref
  tags = {
    Name: "public_instance_sg"
  }
}

resource "aws_security_group_rule" "http_pub" {
  type                     = "ingress"
  from_port                = var.public_instance_sg_http_port
  to_port                  = var.public_instance_sg_http_port
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.internetfacing_alb_sg.id
  security_group_id        = aws_security_group.public_instance_sg.id
}


resource "aws_security_group_rule" "ssh_pub" {
  type              = "ingress"
  from_port         = var.public_instance_sg_ssh_port
  to_port           = var.public_instance_sg_ssh_port
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_instance_sg.id
}
# resource "aws_security_group_rule" "outbound_pub" {
#   type              = "egress"
#   from_port         = var.public_instance_sg_http_port
#   to_port           = var.public_instance_sg_http_port
#   #cidr_blocks       = ["0.0.0.0/0"]
#   source_security_group_id = aws_security_group.internal_alb_sg.id
#   protocol          = "tcp"
#   security_group_id = aws_security_group.public_instance_sg.id
# }

resource "aws_security_group_rule" "outbound_rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_instance_sg.id
}



# create security group for internal load balancer 
resource "aws_security_group" "internal_alb_sg" {
  name = "internal_alb_sg"
  vpc_id = var.vpc_ref
  ingress {
    security_groups = [aws_security_group.public_instance_sg.id]
    description     = "internal routing "
    from_port       = var.internal_alb_port
    to_port         = var.internal_alb_port
    protocol        = "tcp"
  }
  egress {
    #cidr_blocks = ["0.0.0.0/0"]
    description = "internal lb traffic"
    from_port   = var.internal_alb_port
    to_port     = var.internal_alb_port
    protocol    = "tcp"
    #source_security_group_id = aws_security_group.private_instance_sg.id
    security_groups = [aws_security_group.private_instance_sg.id]
  }
   tags = {
    Name: "internal_alb_sg"
  }
}



# create security group for private instance
resource "aws_security_group" "private_instance_sg" {
  name = "private_instance_sg"
  vpc_id = var.vpc_ref
  tags = {
    Name: "private_instance_sg"
  }
}

resource "aws_security_group_rule" "http_priv" {
  type                     = "ingress"
  from_port                = var.private_instance_sg_http_port
  to_port                  = var.private_instance_sg_http_port
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.internal_alb_sg.id
  security_group_id        = aws_security_group.private_instance_sg.id
}


resource "aws_security_group_rule" "ssh_priv" {
  type              = "ingress"
  from_port         = var.private_instance_sg_ssh_port
  to_port           = var.private_instance_sg_ssh_port
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private_instance_sg.id
}
resource "aws_security_group_rule" "outbound_priv" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private_instance_sg.id
}
