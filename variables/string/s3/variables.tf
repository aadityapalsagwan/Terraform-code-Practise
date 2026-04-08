variable "aws_region" {

  type = string
  default = "ap-south-1"
}

variable "bucket_name" {

  type = string

  description = "Name of the S3 bucket"
}

variable "enable_versioning" {

  type = bool

  default = true
}

variable "object_lock_disabled" {

  type = bool

  default = false
}

variable "tags" {

  type = map(string)

  default = {
    Environment = "Dev"
    Owner       = "Adi"
  }
}