 variable "key_pair_name" {
  # description = "the key pair name "
  # type = string
}
variable "public_key" {
  
}

variable "public_instance_sg_id" {}
variable "private_instance_sg_id" {}
# variable "lb_dns" {}
# variable "internal_lb_dns" {}
variable "private_subnets" {
  type = list(string)
}
variable "public_subnets" {
  type = list(string)
}

variable "lb_dns" {}