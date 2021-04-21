organization = "example"
organization_unit = "example"

servers=[
  {
    name                      = "node1"
    subject_common_name       = "node1.example.internal"
    subject_alternative_names = []
  },
  {
    name                      = "node2"
    subject_common_name       = "node2.example.internal"
    subject_alternative_names = []
  },
  {
    name                      = "node3"
    subject_common_name       = "node3.example.internal"
    subject_alternative_names = []

  }
]

allowed_uses = [
  "key_encipherment",
  "digital_signature",
  "server_auth",
  "client_auth"
]