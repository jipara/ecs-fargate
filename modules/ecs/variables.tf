variable "ecs_cluster" {
  description = "Name of the ECS cluster"
}

variable "ecs_service" {
  description = "Name of the ECS service"
}

variable "app_count" {
  description = "Number of tasks to run for the ECS service"
  default     = 1
}

variable "ecs_task_family" {
  description = "The name of the task family"
}

variable "ecs_network_mode" {
  description = "The Docker networking mode to use for the containers in the task"
}

variable "ecs_compatibilities" {
  description = "A list of launch types that the task is compatible with"
}

variable "ecs_task_cpu" {
  description = "The number of cpu units used by the task"
}

variable "ecs_task_memory" {
  description = "The amount of memory (in MiB) used by the task"
}

variable "ecs_task_role_arn" {
  description = "The ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services"
}

variable "ecs_execution_role_arn" {
  description = "The ARN of IAM role that Amazon ECS can assume to create and manage the necessary resources"
}

variable "container_image" {
  description = "The Docker image to use for the container in the task definition"
}

variable "container_cpu" {
  description = "The number of CPU units to reserve for the container"
}

variable "container_memory" {
  description = "The amount of memory (in MiB) to reserve for the container"
}

variable "container_port" {
  description = "The port number on the container that is bound to the user-specified or automatically assigned host port"
}