resource "aws_dynamodb_table" "dynamodb_tb" {
  name           = var.dynamodb_tb_name
  hash_key       = "LockID"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
}