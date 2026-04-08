variable "aws_region" {
  default = "ap-south-1"
}

variable "instance_name" {

  description = "EC2 instance name"

  type = string

  default = null

  nullable = true
}

variable "instance_type" {
  description = "EC2 instance type"

  type = string
  default = "t2.micro"

  validation {
    condition = contains(["t2.micro","t2.small","t3.micro"], var.instance_type)
    error_message = "Instance type must be t2.micro, t2.small or t3.micro."
  }
}

variable "instance_count" {
  description = "Number of instances"

  type = number
  default = 1

  validation {
    condition     = var.instance_count >= 1 && var.instance_count <= 2
    error_message = "Instance count must be 1 or 2."
  }
}

variable "root_volume_size" {
  description = "Root volume size in GB"

  type = number
  default = 10

  validation {
    condition     = var.root_volume_size >= 8 && var.root_volume_size <= 50
    error_message = "Root volume must be between 8GB and 50GB."
  }
}

variable "key_name" {
  description = "Existing AWS key pair name"
  type        = string
}