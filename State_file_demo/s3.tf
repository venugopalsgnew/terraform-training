resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-3jul2024"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}