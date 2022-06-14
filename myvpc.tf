terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.18.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = var.aws-region
  profile = var.aws-profile
}

resource "aws_vpc" "my_webapp_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my_webapp_vpc"
  }
}

