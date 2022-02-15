// Configure AWS provider source and version
terraform {
  required_version = ">= 1.1.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  region = var.region
}


// Declare AZ data source
data "aws_availability_zones" "available" {
  state = "available"
}

// Create a new VPC network
module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  name               = "${var.namespace}-vpc"
  cidr               = var.vpc_cidr
  azs                = data.aws_availability_zones.available.names
  private_subnets    = var.vpc_private_subnets
  public_subnets     = var.vpc_public_subnets
  enable_nat_gateway = true
  single_nat_gateway = true
}

// Create security rule to allow SSH connections from anywhere
resource "aws_security_group" "allow-ssh-pub" {
  name        = "${var.namespace}-allow-ssh-pub"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH from the internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]     // It is best to use your router public IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.namespace}-allow-ssh-pub"
  }
}

// Create security rule to allow SSH connections from VPC public subnets
resource "aws_security_group" "allow-ssh-priv" {
  name        = "${var.namespace}-allow-ssh-priv"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH from internal VPC clients"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.namespace}-allow-ssh-priv"
  }
}

