terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.39.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

variable "env" {
  default = ["dev", "prod", "test"]
}

resource "aws_s3_bucket" "buckets" {
  for_each = toset(var.env)
  bucket   = lower(join("-", [each.value, "myapp", "bucket132"]))

  tags = {
    Name        = upper((each.value))
    Environment = each.value
    CreatedAt   = timestamp()
  }
}