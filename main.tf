module "container_registry" {
  source = "./modules/container_registry"
  region = local.container_registry_region
  plan   = local.container_registry_plan
}

module "vpc_network" {
  source         = "./modules/vpc_network"
  region         = local.vult_region
  v4_subnet      = local.vpc_network_v4_subnet
  v4_subnet_mask = local.vpc_network_v4_subnet_mask
  description    = local.vpc_network_description
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

module "database" {
  source = "./modules/database"

  for_each = local.databases

  database_engine         = each.value.database_engine
  database_engine_version = each.value.database_engine_version
  region                  = local.vult_region
  plan                    = each.value.plan
  label                   = each.value.label
  vpc_id                  = data.vultr_vpc.vpc_id

  # MySQL specific settings
  mysql_long_query_time     = each.value.mysql_long_query_time
  mysql_require_primary_key = each.value.mysql_require_primary_key

  # Valkey specific settings
  valkey_eviction_policy = each.value.eviction_policy

  # kafka specific settings
  kafka_plan_brokers  = each.value.plan_brokers
  kafka_plan_replicas = each.value.plan_replicas

}
