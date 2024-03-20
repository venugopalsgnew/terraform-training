resource "aws_s3_bucket" "example" {
  bucket = var.bucket

  tags = {
    Name        = "My bucket"
    Environment = var.env
  }
}