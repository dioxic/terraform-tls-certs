variable "dns_names" {
  type = list(string)
  description = "Subject alternative names for generated certificates."
  default = []
}

variable "ca_private_key_pem" {}

variable "ca_cert_pem" {}

variable "common_name" {}

variable "organizational_unit" {}

variable "organization" {}

variable "validity_period_hours" {
  type    = number
  default = 720
}

variable "allowed_uses" {
  type    = list(string)
  default = [
    "key_encipherment",
    "digital_signature",
  ]
}