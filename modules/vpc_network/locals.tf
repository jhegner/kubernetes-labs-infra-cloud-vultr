variable "region" {
  description = "The AWS region where the VPC will be created."
  type        = string
  
}

variable "v4_subnet" {
  description = "The IPv4 subnet for the VPC."
  type        = string
  
}

variable "v4_subnet_mask" {
  description = "The subnet mask for the IPv4 subnet."
  type        = number
  
}