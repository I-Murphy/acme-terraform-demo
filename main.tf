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
      name = "aws-demo"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "random_pet" "suffix" {
  length = 2
}

resource "aws_s3_bucket" "demo" {
  bucket = "acme-demo-bucket-${random_pet.suffix.id}"

  tags = {
    Name = "acme-demo-bucket"
  }
}
