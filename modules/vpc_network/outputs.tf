output "vpc_id" {
  description = "The ID of the VPC network."
  value       = vultr_vpc.kubernetes_lab_vpc.id
}