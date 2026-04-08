terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.35.1"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# Existing Key Pair
# resource "aws_key_pair" "deployer" {
#   key_name   = "mumbai-k1"
#   public_key = file("C:/Users/HP/Downloads/mumbai-k1.pub")
# }

# Security Group for SSH
resource "aws_security_group" "ssh_sg" {
  name = "ssh-access"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-019715e0d74f695be"
  instance_type = "t2.micro"
  key_name      = "mumbai-k1"
  security_groups = [aws_security_group.ssh_sg.name]

  tags = {
    Name = "Terraform-EC2-EBS"
  }
}

# EBS Volume
resource "aws_ebs_volume" "my_ebs" {
  availability_zone = aws_instance.my_ec2.availability_zone
  size              = 10

  tags = {
    Name = "Terraform-EBS"
  }
}

# Attach EBS to EC2
resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.my_ebs.id
  instance_id = aws_instance.my_ec2.id
}