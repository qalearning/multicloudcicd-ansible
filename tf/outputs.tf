output "aws_dns" {
  value = module.aws.public_dns
}

output "aws_url" {
  value = "http://${module.aws.public_dns}"
}

output "aws_public_ip" {
  value = module.aws.public_ip
}

output "azure_dns" {
  value = module.azure.public_dns
}

output "azure_url" {
  value = "http://${module.azure.public_dns}"
}

output "azure_public_ip" {
  value = module.azure.public_ip
}

output "aws_pem" {
  value     = module.aws.aws_private_key
  sensitive = true
}

output "azure_pem" {
  value     = module.azure.pem
  sensitive = true
}

resource "local_file" "aws_pem" {
  content  = module.aws.aws_private_key
  filename = "aws.pem"
}

resource "local_file" "azure_pem" {
  content  = module.azure.pem
  filename = "azure.pem"
}