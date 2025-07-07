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
  # Valkey specific settings
  eviction_policy = var.valkey_eviction_policy

}
