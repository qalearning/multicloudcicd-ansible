output "public_dns" {
  value = azurerm_public_ip.public_ip.fqdn
}

output "public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "pem" {
  value = tls_private_key.azure_ssh_key.private_key_pem
}