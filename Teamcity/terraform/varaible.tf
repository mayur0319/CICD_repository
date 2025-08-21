variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket to create"
  type        = string
  default     = "TeamCity-Terraform-Demo-mayur"
}

variable "bucket_prefix" {
  type        = string
  description = "The prefix for the S3 bucket"
  default     = "teamcity-terraform-demo-mayur"
}
variable "domain_name" {
  type        = string
  description = "The domain name to use"
  default     = "demo.hands-on-cloud.com"
}