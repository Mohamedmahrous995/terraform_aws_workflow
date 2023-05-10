# creating elastic ip for nat gatway
resource "aws_eip" "elastic_ip" { 
  vpc = true
  count = 2
  tags = {
    "Name" = "eip-${count.index}"
  }
}


