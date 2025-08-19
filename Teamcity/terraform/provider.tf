terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket         = "terraform-state-mayur"
    key            = "teamcity/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks" # <-- use DynamoDB for state locking
  }
}

provider "aws" {
  region = var.aws_region
}

