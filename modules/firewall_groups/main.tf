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

# TODO alterar modulo para aceitar variáveis de entrada definido no modulo principal

resource "vultr_firewall_rule" "kubernetes_lab_compute_database_firewall_group_rule" {
    firewall_group_id = vultr_firewall_group.kubernetes_lab_compute_database_firewall_group.id
    protocol = local.protocol
    ip_type = local.ip_type
    subnet = local.subnet
    subnet_size = local.subnet_size
    port = local.port
    notes = local.notes
    depends_on = [ vultr_firewall_group.kubernetes_lab_compute_database_firewall_group ]
}