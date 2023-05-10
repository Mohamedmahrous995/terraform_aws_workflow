variable "vpc_ref" {}

# security groups
variable "internetfacing_lb_sg" {}
variable "internal_alb_sg" {}

# subnets 
variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}

# ec2 instances
variable "nginx_server" {
  type = list(string)
}
variable "apache_server" {
  type = list(string)  
}
