# create nate gatway
resource "aws_nat_gateway" "ntgw" {
  count = 2
  allocation_id = var.eip_associate_id[count.index]
  subnet_id = var.public_subnet_id[count.index]
  # allocation_id = "${element(var.eip_associate_id, count.index)}"
  # subnet_id = "${element(var.public_subnet_id, count.index)}"
  tags = {
    "Name" = "ntgw-${count.index}"
  }
}
# resource "aws_nat_gateway" "ntgw_b" {
#   allocation_id = var.eip_secondary
#   subnet_id = var.pub_sub2_id
#   tags = {
#     "Name" = "secondary"
#   }
# }


