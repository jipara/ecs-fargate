output "appautoscaling_target_id" {
  value = aws_appautoscaling_target.target.id
}

output "appautoscaling_policy_arn" {
  value = aws_appautoscaling_policy.policy.arn
}
