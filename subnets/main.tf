resource "aws_subnet" "public" {
  vpc_id = var.vpc_ref
  count = 2 
  cidr_block = var.public_cidr[count.index]
  availability_zone = var.availability_zone[count.index]
  tags = {
    "Name" =  "public-${count.index}"
  }  
}

resource "aws_route_table" "public_rtb" {
  vpc_id = var.vpc_ref
  count = 2
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }  
   tags = {
    "Name" = "public-${count.index}"
  }
  
}

resource "aws_route_table_association" "public_rtb_assoc" {
  count = 2
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rtb[count.index].id
}

## create private subnets
resource "aws_subnet" "private_subnets"{
  vpc_id = var.vpc_ref
  count = 2
  cidr_block = var.private_cidr[count.index]
  availability_zone = var.availability_zone[count.index]
  tags = {
    "Name" = "private-${count.index}"
  }
}

# create route table for private subnet s
resource "aws_route_table" "private_rtb" {
  vpc_id = var.vpc_ref
  count = 2
  route {
    cidr_block = var.route_rule_cidr[count.index]
    nat_gateway_id = var.ntgw_id[count.index]
  } 
  tags = {
    "Name" = "private_rtb-${count.index}"
  }
}

# associate route tables to private subnet 
resource "aws_route_table_association" "private_rtb_assoc" {
  count = 2
  subnet_id = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_rtb[count.index].id
}



