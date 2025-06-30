data "vultr_vpc" "vpc_id" {
  filter {
    name   = "description"
    values = ["${local.vpc_network_description}"]
  }
  
}