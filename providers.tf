terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.26.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }    
  }
}

provider "vultr" {
  api_key = var.VULTR_API_KEY
}

provider "aws" {
  region = local.aws_region
}
