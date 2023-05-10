output "s3_bucket_id" {
  value = module.s3.s3_bucket_id
}
output "s3_object_id" {
  value = module.s3.s3_object_id
}

output "s3_bucket_arn" {
  value = module.s3.s3_bucket_arn
}

output "dynamodb_tb_id" {
  value = module.dynamo_db.dynamodb_tb_id
}
output "dynamodb_tb_billing" {
  value = module.dynamo_db.dynamodb_tb_billing
}
output "dynamodb_tb_hash_key" {
  value = module.dynamo_db.dynamodb_tb_hash_key
}
output "dynamodb_tb_arn" {
  value = module.dynamo_db.dynamodb_tb_arn
}

# output "s3_policy_id" {
#   value = module.iam_policy.s3_policy_id
# }

# output "dynamodb_policy_id" {
#   value = module.iam_policy.dynamodb_policy_id
# }

# #####################################################
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "igw_id" {
  value = module.vpc.igw_id
}

# #########################################################
# # output for elastic ips

output "elastic_ip_id" {
  value = module.elastic_ip.elastic_ip_id
}

# subnets output
output "public_subnet_id" {
  value = module.subnet.public_subnet_id
}
output "public_subnet_cidr" {
  value = module.subnet.public_subnet_cidr
}
output "private_subnet_id" {
  value = module.subnet.private_subnet_id
}
output "private_subnet_cidr" {
  value = module.subnet.private_subnet_cidr
}

# # nat gatways output
output "ntgw_id" {
  value = module.nate_gatway.ntgw_id
}


# security groups output
output "alb_internetfacing_sg_id" {
  value = module.security_group.alb_internetfacing_sg_id
}
output "public_instance_sg_id" {
  value = module.security_group.public_instance_sg
}

output "internal_alb_sg_id" {
  value = module.security_group.internal_alb_sg
}
output "private_instance_sg" {
  value = module.security_group.private_instance_sg
}

#load balncer internetfacing
output "internet_facing_lb_id" {
  value = module.loadbalancer.internet_facing_lb_id
}
output "internet_facing_lb_dns_name" {
  value = module.loadbalancer.internet_facing_lb_dns_name
}

# public instance output nginx
output "nginx_server_id" {
  value = module.instances.nginx_server_id
}
output "nginx_server_public_ip" {
  value = module.instances.nginx_server_public_ip
}

# private instances output apachee
output "apache_server_id" {
  value = module.instances.apache_server_id
}



# # internal load balancer
output "internal_lb_id" {
  value = module.loadbalancer.internal_lb_id
}
output "internal_lb_dns_name" {
  value = module.loadbalancer.internal_lb_dns_name
}
# instances output
output "key_pair_id" {
  value = module.instances.kai_pair_id
}

