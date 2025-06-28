terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.26.0"
    }
  }
}


resource "vultr_container_registry" "kubernetes_lab_container_registry" {
  name = "kuberneteslabcontainerregistry"
  region = var.region
  plan = var.plan
  public = false
}
