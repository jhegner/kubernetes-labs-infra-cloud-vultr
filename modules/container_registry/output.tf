output "container_registry_id" {
  description = "The ID of the Vultr Container Registry."
  value       = vultr_container_registry.kubernetes_lab_container_registry.id
}