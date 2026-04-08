terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.33.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# S3 Bucket with Object Lock
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-terraform-lock-bucket-adi-12345"

  object_lock_enabled = true

  tags = {
    Name = "ObjectLockBucket"
  }
}

# Enable Versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Object Lock Configuration
resource "aws_s3_bucket_object_lock_configuration" "lock_config" {

  bucket = aws_s3_bucket.my_bucket.id

  rule {
    default_retention {

      mode = "GOVERNANCE"

      days = 7
    }
  }
}