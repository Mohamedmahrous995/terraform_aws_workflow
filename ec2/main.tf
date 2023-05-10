
# data "template_file" "nginxـsh" {
#   #template = "${file("nginx.sh")}"
#   template = "${file("${path.module}/nginx.sh.tpl")}"
#   vars = {
#     lb_dns = var.lb_dns_hostname 
#     //you can use any variable directly here
#   }
# }


# data "local_file" "input" {
#   filename = var.input_file
# }


resource "aws_instance" "server_ubuntu" {
  count = 2 
  ami = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
  key_name = var.key_pair_name
  subnet_id = var.public_subnets[count.index]
  vpc_security_group_ids = [var.public_instance_sg_id]
  associate_public_ip_address = true
  user_data = file("${path.module}/nginx.sh") 
  #user_data = "${data.template_file.nginx.sh.rendered}"
  tags = {
    "Name" = "nginx-server-${count.index}"
  }  
}





resource "aws_instance" "apache_server" {
  count = 2
  ami = "ami-02396cdd13e9a1257"
  instance_type ="t2.micro"
  key_name = var.key_pair_name
  subnet_id = var.private_subnets[count.index]
  vpc_security_group_ids = [var.private_instance_sg_id]
  associate_public_ip_address = false
  user_data = file("${path.module}/apache.sh")
  tags = {
    "Name" = "apache-server-${count.index}"
  }
  
}

# resource "aws_instance" "server_apache_b" {
#   ami = "ami-02396cdd13e9a1257"
#   instance_type = "t2.micro"
#   key_name = var.key_pair_name
#   subnet_id = var.subnet4_id
#   vpc_security_group_ids = [var.private_instance_sg_id]
#   associate_public_ip_address = false
#   user_data = file("${path.module}/apache.sh")
#     tags = {
#     "Name" = "apache-b"
#   }
  
# }


