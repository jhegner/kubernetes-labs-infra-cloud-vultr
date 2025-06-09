resource "vultr_container_registry" "kubernetes_lab_container_registry" {
  name = "kubernetes-lab-container-registry"
  region = local.region
  plan = local.plan
  public = false
}
