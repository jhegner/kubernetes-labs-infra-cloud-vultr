output "database_host" {
  description = "The host of the Vultr Managed Database."
  value       = vultr_database.database.host
}