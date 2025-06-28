module "container_registry" {
  source = "./modules/container_registry"
  region = local.container_registry_region
  plan   = local.container_registry_plan
}

module "vpc_network" {
  source = "./modules/vpc_network"
  region = local.vult_region
  v4_subnet = local.vpc_network_v4_subnet
  v4_subnet_mask = local.vpc_network_v4_subnet_mask
}

module "firewall_groups" {
  source      = "./modules/firewall_groups"
  for_each    = local.firewall_rules_map
  protocol    = each.value.protocol
  ip_type     = each.value.ip_type
  subnet      = each.value.subnet
  subnet_size = each.value.subnet_size
  port        = each.value.port
}

module "ssh_key" {
  source  = "./modules/ssh_key"
  ssh_key = var.VULTR_SSH_PUBLIC_KEY
}
