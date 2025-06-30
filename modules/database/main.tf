terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.26.0"
    }
  }
}

resource "vultr_database" "database" {
  database_engine         = var.database_engine
  database_engine_version = var.database_engine_version
  region                  = var.region
  plan                    = var.plan
  label                   = var.label
  vpc_id                  = var.vpc_id

  # MySQL specific settings
  mysql_require_primary_key = var.database_engine == "mysql" ? var.mysql_require_primary_key : null
  mysql_long_query_time     = var.database_engine == "mysql" ? var.mysql_long_query_time : null

  # Valkey specific settings
  eviction_policy = var.database_engine == "valkey" ? var.valkey_eviction_policy : null

  # Kafka specific settings
  plan_replicas = var.database_engine == "kafka" ? var.kafka_plan_replicas : null
  plan_brokers  = var.database_engine == "kafka" ? var.kafka_plan_brokers : null
}
