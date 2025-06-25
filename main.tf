module "container_registry" {
  source = "./modules/container_registry"
}

# TODO passar variáveis de entrada para o módulo de firewall_groups
# e remover os locais definidos no módulo de firewall_groups
module "vpc_network" {
  source = "./modules/vpc_network"
}

# TODO passar variáveis de entrada para o módulo de firewall_groups
# e remover os locais definidos no módulo de firewall_groups
module "firewall_groups" {
  source = "./modules/firewall_groups"
}

module "ssh_key" {
  source = "./modules/ssh_key"
  ssh_key = var.VULTR_SSH_PUBLIC_KEY
}