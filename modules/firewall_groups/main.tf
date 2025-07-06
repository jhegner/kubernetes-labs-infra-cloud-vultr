terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.26.0"
    }
  }
}

resource "vultr_firewall_group" "kubernetes_lab_compute_firewall_group" {
  description = "Kubernetes Lab Compute Firewall Group"
}

resource "vultr_firewall_rule" "kubernetes_lab_firewall_group_rule" {
  firewall_group_id = vultr_firewall_group.kubernetes_lab_firewall_group.id
  protocol          = var.protocol
  ip_type           = var.ip_type
  subnet            = var.subnet
  subnet_size       = var.subnet_size
  port              = var.port
  notes             = var.notes
  depends_on        = [vultr_firewall_group.kubernetes_lab_firewall_group]
}
