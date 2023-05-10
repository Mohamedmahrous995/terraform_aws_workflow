output "alb_internetfacing_sg_id" {
  value = aws_security_group.internetfacing_alb_sg.id
}
output "public_instance_sg" {
  value = aws_security_group.public_instance_sg.id
}

output "internal_alb_sg" {
  value = aws_security_group.internal_alb_sg.id
}
output "private_instance_sg" {
  value = aws_security_group.private_instance_sg.id
}
