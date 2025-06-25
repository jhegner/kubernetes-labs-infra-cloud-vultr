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

resource "vultr_firewall_rule" "kubernetes_lab_compute_database_firewall_group_rule" {
    firewall_group_id = vultr_firewall_group.kubernetes_lab_compute_database_firewall_group.id
    protocol = "tcp"
    ip_type = "v4"
    subnet = "0.0.0.0"
    subnet_size = 0
    port = "8090"
    notes = "my firewall rule"
    depends_on = [ vultr_firewall_group.kubernetes_lab_compute_database_firewall_group ]
}