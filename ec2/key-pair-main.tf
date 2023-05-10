# generates a secure private key and encodes it as PEM
resource "tls_private_key" "demo_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}
# creates the key pair
resource "aws_key_pair" "generated_key" {
  key_name = var.key_pair_name
  
  public_key = tls_private_key.demo_key.public_key_openssh

}

resource "local_file" "local_key_pair" {
  filename = "${var.key_pair_name}.pem"
  file_permission = "0400"
  content = tls_private_key.demo_key.private_key_pem
}