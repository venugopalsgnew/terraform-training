terraform {
  backend "s3" {
    bucket = "mybucket-for-statefiledemo"
    key    = "statefile/terraform.state"
    region = "us-east-1"
    dynamodb_table = "statefile-locking"
  }
}
