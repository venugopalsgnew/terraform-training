module "my_s3_bucket" {
    source = "../../../modules/s3"
    bucket = var.bucket
    env = var.env
    region = var.region
}