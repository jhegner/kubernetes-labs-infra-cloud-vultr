output "firewall_group_id" {
    description = "The ID of the firewall group."
    value       = vultr_firewall_group.kubernetes_lab_firewall_group
}