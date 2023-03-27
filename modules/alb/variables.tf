variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "lb_subnets" {
  description = "The IDs of the subnets in which to create the load balancer"
  type        = list(string)
}

variable "lb_security_groups" {
  description = "The IDs of the security groups to assign to the load balancer"
  type        = list(string)
}

variable "target_group_name" {
  description = "The name of the target group"
  type        = string
}

variable "target_group_port" {
  description = "The port number the target group listens on"
  type        = number
}

variable "target_group_protocol" {
  description = "The protocol the target group uses for connections"
  type        = string
}

variable "target_group_vpc_id" {
  description = "The ID of the VPC in which to create the target group"
  type        = string
}

variable "listener_port" {
  description = "The port number for the listener"
  type        = number
}

variable "listener_protocol" {
  description = "The protocol for the listener"
  type        = string
}