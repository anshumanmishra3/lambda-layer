terraform {
  required_version = ">=1.1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      platform    = var.platform
      project     = var.project
      environment = local.environment
      cost_centre  = var.cost_centre
      code_repo    = var.code_repo
      name         = var.test_name
      
    }
  }
}

