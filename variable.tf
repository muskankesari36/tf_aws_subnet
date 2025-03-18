variable "aws_region" {
  description = "name of aws_region. Eg. 'us-east-1'"
  type        = string
}


variable "subnet_config" {

  type = object({
    subnet_name = string
    vpc_name    = string
    cidr_block  = string
  })

}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
