output "private_key_pem" {
  value = tls_private_key.main.private_key_pem
  sensitive = true
}

output "cert_pem" {
  value = tls_locally_signed_cert.main.cert_pem
  sensitive = true
}

output "combined_pem" {
  value = join("",[tls_locally_signed_cert.main.cert_pem, tls_private_key.main.private_key_pem])
  sensitive = true
}

output "dns_names" {
  value = var.dns_names
}

output "common_name" {
  value = var.common_name
}

output "organization" {
  value = var.organization
}

output "organizational_unit" {
  value = var.organizational_unit
}