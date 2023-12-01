provider "aws" {
    region = var.region
    #access_key = var.AWS_ACCESS_KEY_ID
    #secret_key = var.AWS_SECRET_ACCESS_KEY
}

module "s3module" {
    source  = "../../../modules/s3/"
    bucket_name  = "edp-operations-test-prod-bucket"
    environment = "production"
    group       = "edp"
}
