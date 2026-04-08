variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "instance_type must be one of: t3.micro, t3.small, t3.medium"
  }
}
variable "key_name" {
  description = "Name of the key pair"
  type        = string
}
variable "create_instance" {
  description = "Whether to create EC2 instances"
  type        = bool
}
variable "environments" {
  description = "Environment names"
  type        = list(string)
  default = ["dev", "test", "prod"]
}