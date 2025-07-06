output "vpc_id" {
  description = "The ID of the VPC network."
  value       = vultr_vpc.kubernetes_lab_vpc.id
}

output "vpc_description" {
  description = "The description of the VPC network."
  value       = vultr_vpc.kubernetes_lab_vpc.description
  
}