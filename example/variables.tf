variable "servers" {
  type = list(object({
    name                      = string
    subject_common_name       = string
    subject_alternative_names = list(string)
  }))
}

variable "organization" {
  type = string
}

variable "organization_unit" {
  type = string
}

variable "allowed_uses" {
  type    = list(string)
}