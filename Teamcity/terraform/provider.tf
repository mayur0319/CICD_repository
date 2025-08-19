terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket       = "terraform-state-mayur"
    key          = "teamcity/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}

provider "aws" {
  region = var.aws_region
}
