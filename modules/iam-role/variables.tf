variable "role_name" {
  type        = string
  description = "The name of the IAM role to create"
}

variable "assume_role_policy" {
  type        = string
  description = "The JSON policy that grants an entity permission to assume the role"
}

variable "policy_arns" {
  type        = set(string)
  description = "A set of ARNs of IAM policies to attach to the role"
}