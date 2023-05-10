output "kai_pair_id" {
  value = aws_key_pair.generated_key.id
}

output "nginx_server_id" {
  value = ["${aws_instance.server_ubuntu.*.id}"]
}
output "nginx_server_public_ip" {
  value = ["${aws_instance.server_ubuntu.*.public_ip}"]
}

output "apache_server_id" {
  value = ["${aws_instance.apache_server.*.id}"]
}