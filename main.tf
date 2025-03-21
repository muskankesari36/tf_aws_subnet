data "aws_vpc" "this" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_config.vpc_name]
  }
}

locals {
  vpc_id = data.aws_vpc.this.id
}

resource "aws_subnet" "this" {
  vpc_id     = local.vpc_id
  cidr_block = var.subnet_config.cidr_block

  tags = merge({
    Name = var.subnet_config.subnet_name
  }, var.tags)
}