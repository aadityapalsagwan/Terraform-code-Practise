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

module "ec2" {
  source = "git::https://github.com/aadityapalsagwan/terraform-modules.git?ref=v1.2"

  ami           = "ami-05d2d839d4f73aafb"
  instance_type = "t2.micro"
  name          = "my-remote-ec2"

  key_name      = "mumbai-k1"   # 👈 yaha dena hai
}