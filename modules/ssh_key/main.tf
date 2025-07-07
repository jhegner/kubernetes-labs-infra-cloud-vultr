terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.26.0"
    }
  }
}

resource "vultr_ssh_key" "kubernetes_lab_compute_ssh_key" {
  name = "kubernetes_lab_compute_ssh_key"
  ssh_key = var.ssh_key
}