provider "aws" {
  region = "ap-south-1"
}

# Random suffix (bucket name unique hona chahiye)
resource "random_id" "suffix" {
  byte_length = 2
}

# Public S3 Module
module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.0"

  bucket = "my-simple-bucket-${random_id.suffix.hex}"

  tags = {
    Name        = "My Simple Bucket"
    Environment = "Dev"
  }
}