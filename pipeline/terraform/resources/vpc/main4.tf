
# Provider Block
provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "tia-terraform-state-backend"
    key    = "state/vpc"
    region = "us-east-1"
    # dynamodb_table = "terraform_state"
  }
}
