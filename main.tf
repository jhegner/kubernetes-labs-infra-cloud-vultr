module "container_registry" {
  source = "./modules/container_registry"
}

module "vpc_network" {
  source = "./modules/vpc_network"
}

module "firewall_groups" {
  source = "./modules/firewall_groups"
}

module "ssh_key" {
  source = "./modules/ssh_key"
  ssh_key = var.VULTR_SSH_PUBLIC_KEY
}