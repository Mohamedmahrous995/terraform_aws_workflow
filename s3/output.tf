output "s3_bucket_id" {
  value = aws_s3_bucket.bucket1.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.bucket1.arn
}

output "s3_object_id" {
  value = aws_s3_object.object.id
}

