# Define toggle variables for enabling or disabling modules creation
locals {
  toggle_modules = {
    create_container_registry = false
    create_vpc_network        = true
    create_firewall_rules     = true
    create_databases          = false
    create_ssh_key            = false
  }
}