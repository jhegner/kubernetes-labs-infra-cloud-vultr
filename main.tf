module "container_registry" {

  count  = local.toggle_modules.create_container_registry ? 1 : 0
  source = "./modules/container_registry"

  region = local.container_registry_region
  plan   = local.container_registry_plan
}

module "vpc_network" {

  count          = local.toggle_modules.create_vpc_network ? 1 : 0
  source         = "./modules/vpc_network"
  
  region         = local.vultr_region
  v4_subnet      = local.vpc_network_v4_subnet
  v4_subnet_mask = local.vpc_network_v4_subnet_mask
  description    = local.vpc_network_description
}

module "firewall_groups" {
  
  source      = "./modules/firewall_groups"
  
  for_each    = local.toggle_modules.create_firewall_rules ? local.firewall_rules_map : {}
  protocol    = each.value.protocol
  ip_type     = each.value.ip_type
  subnet      = each.value.subnet
  subnet_size = each.value.subnet_size
  port        = each.value.port
}

module "ssh_key" {
  
  count   = local.toggle_modules.create_ssh_key ? 1 : 0
  source  = "./modules/ssh_key"
  
  ssh_key = var.VULTR_SSH_PUBLIC_KEY
}

module "database" {

  source = "./modules/database"

  for_each = local.toggle_modules.create_databases ? local.databases : {}

  database_engine         = each.value.database_engine
  database_engine_version = each.value.database_engine_version
  region                  = local.vultr_region
  plan                    = each.value.plan
  label                   = each.value.label
  vpc_id                  = module.vpc_network[0].vpc_id

  # Valkey specific settings
  valkey_eviction_policy = each.value.eviction_policy

  depends_on = [ module.vpc_network ]

}
