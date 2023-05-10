# variable for the attached vpc
variable "vpc_ref" {}

# variables for subnet1
# variable "pub_sub1_cidr" {}

# # variables for subnet2
# variable "pub_sub2_cidr" {}


# variables for availability zone
# variable "zone_a" {}
# variable "zone_b" {}

variable "availability_zone" {
  type = list(string)
}

# public subnet cidr block
variable "public_cidr" {
  type = list(string)
}
# internet gateway variable
variable "igw_id" {}
# variables for private subnets cidr 
variable "private_cidr" {
  type = list(string)
}
#natgateway variable
variable "ntgw_id" {}

variable "route_rule_cidr" {
  type = list(string)
}

