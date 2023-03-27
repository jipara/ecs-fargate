resource "aws_iam_role" "ECSToECR" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy
}

resource "aws_iam_role_policy_attachment" "CloudWatchAgentServer" {
  for_each   = var.policy_arns
  policy_arn = each.value
  role       = aws_iam_role.ECSToECR.name
}