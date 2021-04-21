locals {
  ca_cert_pem = file("${path.module}/certs/ca.crt")
  ca_private_key_pem = file("${path.module}/certs/ca.key")
  cert_map     = { for o in var.servers : o.name => {
    name       = o.name
    cn         = o.subject_common_name
    san        = o.subject_alternative_names
  }}
}

module "tls_certs" {
  source   = "../"

  for_each = local.cert_map

  ca_cert_pem         = local.ca_cert_pem
  ca_private_key_pem  = local.ca_private_key_pem
  organization        = var.organization
  organizational_unit = var.organization_unit
  common_name         = each.value["cn"]
  dns_names           = concat([each.value["cn"]], each.value["san"])
  allowed_uses        = var.allowed_uses
}

resource "local_file" "cert_pem" {
  for_each = local.cert_map

  content    = module.tls_certs[each.key].combined_pem
  filename   = "${path.module}/generated/${each.value["name"]}.pem"
}