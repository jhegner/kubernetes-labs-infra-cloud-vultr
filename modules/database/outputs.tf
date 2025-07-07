output "host" {
  description = "The host of the Vultr Managed Database."
  value       = vultr_database.database.host
}

output "dbname" {
  description = "The name of the Vultr Managed Database."
  value       = vultr_database.database.dbname
}


output "user" {
  description = "The user of the Vultr Managed Database."
  value       = vultr_database.database.user
}


output "password" {
  description = "The password of the Vultr Managed Database user."
  value       = vultr_database.database.password
  sensitive   = true
}


output "status" {
  description = "The status of the Vultr Managed Database."
  value       = vultr_database.database.status
}
