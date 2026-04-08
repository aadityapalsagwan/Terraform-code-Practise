resource "aws_instance" "example" {
  count = var.create_instance ? length(var.environments) : 0
  ami           = "ami-0a14f53a6fe4dfcd1"
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name        = "Terraform-${var.environments[count.index]}"
    Environment = var.environments[count.index]
  }
}