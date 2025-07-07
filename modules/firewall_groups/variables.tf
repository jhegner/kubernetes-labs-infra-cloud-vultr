# This file defines the variables for the firewall groups module.

variable "protocol" {
    description = "The protocol for the firewall rule (e.g., TCP, UDP, ICMP)"
    type        = string
    default     = "TCP"
}

variable "ip_type" {
    description = "The type of IP address (e.g., v4, v6)"
    type        = string
    default     = "v4"  
}

variable "subnet" {
    description = "The subnet for the firewall rule"
    type        = string  
}

variable "subnet_size" {
    description = "The size of the subnet (e.g., 24 for a /24 subnet)"
    type        = number      
}

variable "port" {
    description = "The port for the firewall rule"
    type        = string    
}

variable "notes" {
    description = "Notes for the firewall rule"
    type        = string
    default     = "No specific notes provided"
}

