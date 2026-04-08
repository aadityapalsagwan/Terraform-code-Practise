output "instance_ids" {
  description = "IDs of the created EC2 instances"
  value       = aws_instance.example.*.id
}
output "instance_public_ips" {
  description = "Public IPs of the created EC2 instances"
  value       = aws_instance.example.*.public_ip
}
output "instance_tags" {
  description = "Tags of the created EC2 instances"
  value       = aws_instance.example.*.tags
}