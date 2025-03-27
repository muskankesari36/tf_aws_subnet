# data "aws_vpc" "this" {
#   filter {
#     name   = "tag:Name"
#     values = [var.subnet_config.vpc_name]
#   }
# }

# Get a list of AZs dynamically
data "aws_availability_zones" "available" {}

# locals {
#   vpc_id = data.aws_vpc.this.id
# }

resource "aws_subnet" "this" {
  for_each = var.subnet_config.az_cidr_map

  vpc_id     = var.vpc_id
  cidr_block        = each.value.cidr_block
  map_public_ip_on_launch = coalesce(var.subnet_config.map_public_ip_on_launch, var.subnet_config_defaults.map_public_ip_on_launch)
  availability_zone = each.key

  tags = merge({
    Name = each.value.custom_name
  }, var.tags)
}