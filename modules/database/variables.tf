variable "database_engine" {
  description = "The database engine to use (e.g., mysql, postgresql, valkey, kafka)"
  type        = string
  
}

variable "database_engine_version" {
  description = "The version of the database engine to use"
  type        = string
  
}

variable "region" {
  description = "The region where the database will be deployed"
  type        = string
  
}

variable "plan" {
  description = "The plan for the database instance"
  type        = string  
  
}

variable "label" {
  description = "A label for the database instance"
  type        = string
  default     = "Lab database instance vultr"
  
}

variable "vpc_id" {
  description = "The ID of the VPC network to associate with the database"
  type        = string
    
}
variable "valkey_eviction_policy" {
  description = "The eviction policy for Valkey databases"
  type        = string
  default     = null
}
