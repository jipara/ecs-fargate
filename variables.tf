# variable "alb_name" {
#   description = "The name of the load balancer"
#   type        = string
# }

# variable "alb_subnets" {
#   description = "The IDs of the subnets in which to create the load balancer"
#   type        = list(string)
# }

# variable "lb_security_groups" {
#   description = "The IDs of the security groups to assign to the load balancer"
#   type        = list(string)
# }

# variable "target_group_name" {
#   description = "The name of the target group"
#   type        = string
# }

# variable "target_group_port" {
#   description = "The port number the target group listens on"
#   type        = number
# }

# variable "target_group_protocol" {
#   description = "The protocol the target group uses for connections"
#   type        = string
# }

# variable "target_group_vpc_id" {
#   description = "The ID of the VPC in which to create the target group"
#   type        = string
# }

# variable "listener_port" {
#   description = "The port number for the listener"
#   type        = number
# }

# variable "listener_protocol" {
#   description = "The protocol for the listener"
#   type        = string
# }

# variable "max_capacity" {
#   description = "Maximum capacity for the target"
#   type        = number
#   default     = 5
# }

# variable "min_capacity" {
#   description = "Minimum capacity for the target"
#   type        = number
#   default     = 1
# }

# variable "resource_id" {
#   description = "ID of the resource being scaled"
#   type        = string
# }

# variable "scalable_dimension" {
#   description = "Dimension being scaled"
#   type        = string
# }

# # variable "service_namespace" {
# #   description = "Namespace of the service"
# #   type        = string
# # }

# variable "policy_name" {
#   description = "Name of the scaling policy"
#   type        = string
#   default     = "default-policy"
# }

# variable "target_metric_type" {
#   description = "Type of the metric being tracked"
#   type        = string
#   default     = "ECSServiceAverageCPUUtilization"
# }

# variable "target_value" {
#   description = "Target value for the metric being tracked"
#   type        = number
#   default     = 0.02
# }

# variable "ecs_cluster" {
#   description = "Name of the ECS cluster"
# }

# variable "ecs_service" {
#   description = "Name of the ECS service"
# }

# variable "app_count" {
#   description = "Number of tasks to run for the ECS service"
#   default     = 1
# }

# variable "ecs_task_family" {
#   description = "The name of the task family"
# }

# variable "ecs_network_mode" {
#   description = "The Docker networking mode to use for the containers in the task"
# }

# variable "ecs_compatibilities" {
#   description = "A list of launch types that the task is compatible with"
# }

# variable "ecs_task_cpu" {
#   description = "The number of cpu units used by the task"
# }

# variable "ecs_task_memory" {
#   description = "The amount of memory (in MiB) used by the task"
# }

# variable "ecs_task_role_arn" {
#   description = "The ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services"
# }

# variable "ecs_execution_role_arn" {
#   description = "The ARN of IAM role that Amazon ECS can assume to create and manage the necessary resources"
# }

# variable "container_image" {
#   description = "The Docker image to use for the container in the task definition"
# }

# variable "container_cpu" {
#   description = "The number of CPU units to reserve for the container"
# }

# variable "container_memory" {
#   description = "The amount of memory (in MiB) to reserve for the container"
# }

# variable "container_port" {
#   description = "The port number on the container that is bound to the user-specified or automatically assigned host port"
# }

# variable "role_name" {
#   type        = string
#   description = "The name of the IAM role to create"
# }

# variable "assume_role_policy" {
#   type        = string
#   description = "The JSON policy that grants an entity permission to assume the role"
# }

# variable "policy_arns" {
#   type        = set(string)
#   description = "A set of ARNs of IAM policies to attach to the role"
# }
variable "lb_sg_name" {
  description = "Name of the ALB security group"
  type        = string
  default     = "example-alb-security-group"
}

variable "task_sg_name" {
  description = "Name of the task security group"
  type        = string
  default     = "example-task-security-group"
}

# variable "vpc_id" {
#   description = "ID of the VPC"
#   type        = string
# }

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

variable "state" {
  description = "The state of the availability zones to filter on (available, unavailable, etc.)"
  default     = "available"
}


