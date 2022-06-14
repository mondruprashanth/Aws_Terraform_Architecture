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

data "aws_ami" "amazon-ami" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*.*.*-x86_64-gp2"]
  }
  tags = {
    "Name" = "Ami"
  }
}



resource "aws_instance" "my_instance" {
  ami           = data.aws_ami.amazon-ami.id
  instance_type = "t2.micro"
subnet_id = data.aws_subnet.public.id
  



  tags = {
    Name = "HelloWorld"
  }
}
