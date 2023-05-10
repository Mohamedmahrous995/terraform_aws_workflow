output "dynamodb_tb_id" {
  value = aws_dynamodb_table.dynamodb_tb.id
}
output "dynamodb_tb_billing" {
  value = aws_dynamodb_table.dynamodb_tb.billing_mode
}
output "dynamodb_tb_hash_key" {
  value = aws_dynamodb_table.dynamodb_tb.hash_key
}
output "dynamodb_tb_arn" {
  value = aws_dynamodb_table.dynamodb_tb.arn
}