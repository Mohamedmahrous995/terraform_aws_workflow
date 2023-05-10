
module "s3" {
  source      = "./s3"
  bucket_name = "tereraformworkspaceremote123456kn789"
  object_name = "terraform.tfstate"

}

module "dynamo_db" {
  source           = "./dynamo_db"
  dynamodb_tb_name = "terraform-state-lock-dynamo"
}
# module "iam_policy" {
#   source   = "./iam_policy"
#   mybucket = module.s3.s3_bucket_id
#   key_path = module.s3.s3_object_id
#   mytable  = module.dynamo_db.dynamodb_tb_id
# }
module "vpc" {
  source   = "./vpc"
  vpc_cidr = "10.0.0.0/16"
}
module "subnet" {
  source            = "./subnets"
  vpc_ref           = module.vpc.vpc_id
  igw_id            = module.vpc.igw_id
  availability_zone = ["us-east-1a", "us-east-1b"]
  public_cidr       = ["10.0.0.0/24", "10.0.1.0/24"]
  private_cidr      = ["10.0.2.0/24", "10.0.3.0/24"]
  route_rule_cidr    = ["0.0.0.0/0","0.0.0.0/0"]
  ntgw_id           = module.nate_gatway.ntgw_id[0]


}

module "elastic_ip" {
  source = "./elastic_ip"
}
module "nate_gatway" {
  source           = "./nat_gateway"
  eip_associate_id = module.elastic_ip.elastic_ip_id[0]
  public_subnet_id = module.subnet.public_subnet_id[0]
}

module "security_group" {
  source                        = "./security_group"
  alb_internetfacing_port       = "80"
  vpc_ref                       = module.vpc.vpc_id
  public_instance_sg_http_port  = "80"
  public_instance_sg_ssh_port   = "22"
  private_instance_sg_http_port = "80"
  private_instance_sg_ssh_port  = "22"
  internal_alb_port             = "80"
}

module "instances" {
  source                 = "./ec2"
  public_subnets = module.subnet.public_subnet_id[0]
  private_subnets = module.subnet.private_subnet_id[0]
  private_instance_sg_id = module.security_group.private_instance_sg
  public_instance_sg_id  = module.security_group.public_instance_sg
  key_pair_name          = "test"
  public_key             = "public_key"
  lb_dns                 = module.loadbalancer.internal_lb_dns_name
  #internal_lb_dns_name   = module.loadbalancer.lb_dns_hostname

}
module "loadbalancer" {
  source               = "./LB"
  vpc_ref              = module.vpc.vpc_id
  public_subnets       = module.subnet.public_subnet_id[0]
  private_subnets      = module.subnet.private_subnet_id[0]
  nginx_server         = module.instances.nginx_server_id[0]
  apache_server        = module.instances.apache_server_id[0]
  internal_alb_sg      = module.security_group.internal_alb_sg
  internetfacing_lb_sg = module.security_group.alb_internetfacing_sg_id

}