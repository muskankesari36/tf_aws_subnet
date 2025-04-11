variable "aws_region" {
  description = "name of aws_region. Eg. 'us-east-1'"
  type        = string
}

variable "subnet_config_defaults" {

  type = object({
    map_public_ip_on_launch = bool
  })

  default = {
    map_public_ip_on_launch = false
  }

}

variable "vpc_id" {
  type = string

}

variable "subnet_config" {

  type = object({
    map_public_ip_on_launch = optional(bool)
    az_cidr_map = map(object({
      cidr_block  = string
      custom_name = string
    }))
  })

}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
