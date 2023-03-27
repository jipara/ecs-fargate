variable "max_capacity" {
  description = "Maximum capacity for the target"
  type        = number
  default     = 5
}

variable "min_capacity" {
  description = "Minimum capacity for the target"
  type        = number
  default     = 1
}

variable "resource_id" {
  description = "ID of the resource being scaled"
  type        = string
}

variable "scalable_dimension" {
  description = "Dimension being scaled"
  type        = string
}

variable "service_namespace" {
  description = "Namespace of the service"
  type        = string
}

variable "policy_name" {
  description = "Name of the scaling policy"
  type        = string
  default     = "default-policy"
}

variable "target_metric_type" {
  description = "Type of the metric being tracked"
  type        = string
  default     = "ECSServiceAverageCPUUtilization"
}

variable "target_value" {
  description = "Target value for the metric being tracked"
  type        = number
  default     = 0.02
}
