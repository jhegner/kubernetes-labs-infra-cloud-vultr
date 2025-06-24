terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.26.0"
    }
  }
}

resource "vultr_firewall_group" "kubernetes_lab_compute_database_firewall_group" {
    description = "Kubernetes Lab Compute Database Firewall Group"
}