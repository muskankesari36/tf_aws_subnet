output "subnet_id" {
  value = { for k, v in aws_subnet.this : k => v.id }

}


output "cidr_block" {
  value = { for k, v in aws_subnet.this : v.tags["Name"] => v.cidr_block }
}