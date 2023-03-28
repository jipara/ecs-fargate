variable "lb_sg_name" {
  description = "Name of the ALB security group"
  type        = string
  default     = "example-alb-security-group"
}

variable "ecs_sg_name" {
  description = "Name of the task security group"
  type        = string
  default     = "example-task-security-group"
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "task_sg_id" {
  description = "Name of the task security group"
  type        = string
}
