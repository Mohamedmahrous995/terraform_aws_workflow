output "s3_policy_id" {
  value = aws_iam_policy.s3_policy.id
}

output "dynamodb_policy_id" {
  value = aws_iam_policy.dynamodb_policy
}