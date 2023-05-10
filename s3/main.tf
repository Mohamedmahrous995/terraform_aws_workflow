resource "aws_s3_bucket" "bucket1" {
  bucket = var.bucket_name
  
  
  tags = {
    "Name" = "test"
  }
}

resource "aws_s3_bucket_ownership_controls" "bucket1" {
  bucket = aws_s3_bucket.bucket1.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucket1" {
  depends_on = [aws_s3_bucket_ownership_controls.bucket1]

  bucket = aws_s3_bucket.bucket1.id
  acl    = "private"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.bucket1.id
  key = var.object_name
}

