output "public_dns" {
  value = aws_instance.web_server.public_dns
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}

output "aws_private_key" {
  value = tls_private_key.aws_ssh_key.private_key_pem
}