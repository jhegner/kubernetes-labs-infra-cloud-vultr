# Global variables for the Vult and AWS regions
locals {
  vult_region = "atl"
  aws_region  = "us-east-1"
}

# Define the region for the container registry
locals {
  container_registry_region = "ewr"
  container_registry_plan   = "start_up"
}

# Define the VPC network configuration
locals {
  vpc_network_v4_subnet      = "192.168.0.0"
  vpc_network_v4_subnet_mask = 23
  vpc_network_description    = "Kubernetes Labs VPC Network"
}

# Define the firewall rules for the VPC network
locals {
  firewall_rules = [
    {
      protocol    = "TCP"
      ip_type     = "v4"
      subnet      = local.vpc_network_v4_subnet
      subnet_size = local.vpc_network_v4_subnet_mask
      port        = "22"
      notes       = "SSH access for management"
    }
  ]
  firewall_rules_map = { for idx, rule in local.firewall_rules : "${rule.protocol}-${rule.ip_type}-${rule.subnet}-${rule.subnet_size}-${rule.port}-${idx}" => rule }
}

# Define the database configurations (MySQL, Valkey, Kafka)
locals {
  databases = {
    mysql = {
      database_engine           = "mysql"
      database_engine_version   = "8"
      region                    = local.vult_region
      plan                      = "vultr-dbaas-startup-cc-1-55-2"
      label                     = "Kubernetes Labs MySQL Database"
      mysql_long_query_time     = 3
      mysql_require_primary_key = true
    },
    valkey = {
      database_engine         = "valkey"
      database_engine_version = "7"
      region                  = local.vult_region
      plan                    = "vultr-dbaas-startup-rp-intel-1-12-2"
      label                   = "Kubernetes Labs Valkey Database"
      eviction_policy         = "volatile-ttl" # Removes keys with a TTL set
    },
    kafka = {
      database_engine         = "kafka"
      database_engine_version = "3.8"
      region                  = local.vult_region
      plan                    = "vultr-dbaas-startup-3x-occ-so-2-30-2"
      label                   = "Kubernetes Labs Kafka Database"
      plan_replicas           = "0"
      plan_brokers            = "3"      
    }
  }
}
