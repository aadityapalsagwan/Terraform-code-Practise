resource "aws_instance" "example" {
  for_each = var.create_instance ? var.environments : {}
  ami           = "ami-0a14f53a6fe4dfcd1"
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name        = "Terraform-${each.key}"
    Environment = each.value
  }
}