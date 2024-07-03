terraform {
  backend "s3" {
    bucket = "example-bucket-3jul2024"
    key    = "statefile/terraform.state"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locks-3jul"
  }
}
