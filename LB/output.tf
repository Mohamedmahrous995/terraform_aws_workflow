output "internet_facing_lb_id" {
  value = aws_alb.internet_facing_lb.id
}
output "internet_facing_lb_dns_name" {
  value = aws_alb.internet_facing_lb.dns_name
}
output "internal_lb_id" {
  value = aws_alb.internal_alb.id
}
output "internal_lb_dns_name" {
  value = aws_alb.internal_alb.dns_name
}