output "subnet_id" {
  value = { for k, v in aws_subnet.this : v.tags["Name"] => v.id }

}

output "subnet_az_map" {
  value = {
    for k, v in aws_subnet.this : v.id => v.availability_zone
  }
}

output "cidr_block" {
  value = { for k, v in aws_subnet.this : v.tags["Name"] => v.cidr_block }
}