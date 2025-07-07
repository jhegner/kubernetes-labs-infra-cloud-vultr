terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.26.0"
    }
  }
}

resource "vultr_vpc" "kubernetes_lab_vpc" {
    description = var.description
    region = var.region
    v4_subnet  = var.v4_subnet
    v4_subnet_mask = var.v4_subnet_mask
}