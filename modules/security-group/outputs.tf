output "lb_sg_id" {
  description = "ID of the ALB security group"
  value       = aws_security_group.lb.id
}

# output "task_sg_id" {
#   description = "ID of the task security group"
#   value       = aws_security_group.task.id
# }