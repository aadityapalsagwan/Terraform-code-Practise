terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.33.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}

# 1. Generate Private Key
# resource "tls_private_key" "ec2_key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# 2. Create AWS Key Pair using generated public key
# resource "aws_key_pair" "generated_key" {
#   key_name   = "terraform-ec2-key"
#   public_key = tls_private_key.ec2_key.public_key_openssh
# }

# 3. Save Private Key in Download Folder
# resource "local_file" "private_key" {
#   content  = tls_private_key.ec2_key.private_key_pem
#   filename = "C:/Users/HP/Downloads/terraform-ec2-key.pem"
#   file_permission = "0400"
# }

# 4. Create EC2 Instance
# resource "aws_instance" "my_ec2" {
#   ami           = "ami-0ffef61f6dc37ae89"   # Red Hat Linux  (ap-south-1)
#   instance_type = "t2.micro"
#   key_name      = aws_key_pair.generated_key.key_name

#   tags = {
#     Name = "Terraform-EC2"
#   }
# }


# Existing VPC Fetch
data "aws_vpc" "my_vpc" {
  filter {
    name   = "tag:Name"
    values = ["My-VPC"]
  }
}

# Public Subnet Fetch
data "aws_subnet" "public_subnet" {
  filter {
    name   = "tag:Name"
    values = ["Public-Subnet"]
  }
}

# Security Group Fetch
data "aws_security_group" "ssh_sg" {
  filter {
    name   = "group-name"
    values = ["allow-ssh"]
  }

  vpc_id = data.aws_vpc.my_vpc.id
}

# Generate Key Pair
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# AWS Key Pair
resource "aws_key_pair" "generated_key" {
  key_name   = "terraform-key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

# Save Key in Download Folder
resource "local_file" "pem_file" {
  content  = tls_private_key.ec2_key.private_key_pem
  filename = "C:/Users/HP/Downloads/terraform-key.pem"
}

# EC2 Instance
resource "aws_instance" "my_ec2" {

  ami           = "ami-0ffef61f6dc37ae89"
  instance_type = "t2.micro"

  subnet_id = data.aws_subnet.public_subnet.id

  vpc_security_group_ids = [
    data.aws_security_group.ssh_sg.id
  ]

  key_name = aws_key_pair.generated_key.key_name

  tags = {
    Name = "Terraform-EC2"
  }
}