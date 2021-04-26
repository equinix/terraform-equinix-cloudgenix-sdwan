provider "equinix" {
  client_id     = var.equinix_client_id
  client_secret = var.equinix_client_secret
}

module "cloudgenix" {
  source               = "equinix/cloudgenix-sdwan/equinix"
  version              = "1.0.0"
  name                 = "tf-cloudgenix"
  metro_code           = var.metro_code_primary
  platform             = "medium"
  software_package     = "3104V"
  term_length          = 1
  notifications        = ["test@test.com"]
  additional_bandwidth = 100
  acl_template_id      = equinix_network_acl_template.cloudgenix-pri.id
  license_key          = "2010-21ec41ce-5314-555c-d4ec-451ccae4867e"
  license_secret       = "e11bd5eef6c4b514ddbe734d441af890784a341e"
  secondary = {
    enabled              = true
    metro_code           = var.metro_code_secondary
    additional_bandwidth = 150
    acl_template_id      = equinix_network_acl_template.cloudgenix-sec.id
    license_key          = "2010-21ec41ce-5314-555c-d4ec-451ccae4867e"
    license_secret       = "e11bd5eef6c4b514ddbe734d441af890784a341e"
  }
}

resource "equinix_network_acl_template" "cloudgenix-pri" {
  name        = "tf-cloudgenix-pri"
  description = "Primary Cloudgenix ACL template"
  metro_code  = var.metro_code_primary
  inbound_rule {
    subnets  = ["193.39.0.0/16", "12.16.103.0/24"]
    protocol = "TCP"
    src_port = "any"
    dst_port = "22"
  }
}

resource "equinix_network_acl_template" "cloudgenix-sec" {
  name        = "tf-cloudgenix-sec"
  description = "Secondary Cloudgenix ACL template"
  metro_code  = var.metro_code_secondary
  inbound_rule {
    subnets  = ["193.39.0.0/16", "12.16.103.0/24"]
    protocol = "TCP"
    src_port = "any"
    dst_port = "22"
  }
}
