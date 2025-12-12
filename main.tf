terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "YOUR_ORG_NAME"

    workspaces {
      name = "acme-terraform-demo"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "storage" {
  source = "./modules/storage"
  prefix = var.bucket_prefix
}
