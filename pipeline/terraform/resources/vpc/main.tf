

# Provider Block
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "vpc-test"
  }
}

terraform {
  backend "s3" {
    bucket = "tia-terraform-state-backend"
    key    = "state/vpc"
    region = "us-east-1"
    # dynamodb_table = "terraform_state"
  }
}
