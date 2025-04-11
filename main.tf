terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# provider "aws" {}

# module "vpc"            { source = "./vpc.tf" }
# module "subnets"        { source = "./subnets.tf" }
# module "security_groups" { source = "./security_groups.tf" }
# module "ec2_instances"  { source = "./ec2_instances.tf" }

data "aws_caller_identity" "current" {}

