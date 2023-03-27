output "appautoscaling_target_id" {
  value = aws_appautoscaling_target.dev_to_target.id
}

output "appautoscaling_policy_arn" {
  value = aws_appautoscaling_policy.dev_to_cpu.arn
}