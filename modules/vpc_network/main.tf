terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.26.0"
    }
  }
}

resource "vultr_vpc" "kubernetes_lab_vpc" {
    description = "Kubernetes Lab VPC"
    region = local.region
    v4_subnet  = local.v4_subnet
    v4_subnet_mask = local.v4_subnet_mask
}