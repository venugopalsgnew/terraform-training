terraform {
  backend "s3" {
    bucket = "edp-state-files"
    key    = "prod/tfstate/terraform.tfstate"
    region = "ap-southeast-1"
  }
}