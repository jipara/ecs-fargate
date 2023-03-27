variable "availability_zone_count" {
  default = 2
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block_offset" {
  default = 2
}

variable "private_subnet_cidr_block_offset" {
  default = 0
}