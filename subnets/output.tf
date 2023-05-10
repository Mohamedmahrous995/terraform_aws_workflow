# output "pub_sub1_id" {
#   value = aws_subnet.pub_sub1.id
# }
# output "pub_sub1_cidr" {
#   value = aws_subnet.pub_sub1.cidr_block
# }

# output "pub_sub2_id" {
#   value = aws_subnet.pub_sub2.id
# }
# output "pub_sub2_cidr" {
#   value = aws_subnet.pub_sub2.cidr_block
# }

output "public_subnet_id" {
  value = ["${aws_subnet.public.*.id}"]
}
output "public_subnet_cidr" {
  value = aws_subnet.public.*.cidr_block
}

output "private_subnet_id" {
  value = ["${aws_subnet.private_subnets.*.id}"]
}
output "private_subnet_cidr" {
  value = aws_subnet.private_subnets.*.cidr_block
}


# output "priv_sub3_id" {
#   value = aws_subnet.priv_sub3.id
# }
# output "priv_sub3_cidr" {
#   value = aws_subnet.priv_sub3.cidr_block
# }
# output "priv_sub4_id" {
#   value = aws_subnet.priv_sub4.id
# }
# output "priv_sub4_cidr" {
#   value = aws_subnet.priv_sub4.cidr_block
# }


