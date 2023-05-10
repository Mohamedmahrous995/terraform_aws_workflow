output "ntgw_id" {
  value = ["${aws_nat_gateway.ntgw.*.id}"]
}

