provider "aws" {
    region = var.region
}

module "s3module" {
    source  = "../../../modules/s3"
    bucket_name = var.bucket_name
    region = var.region
    division = var.division
}


module "s3module_project2" {
    source  = "../../../modules/s3"
    bucket_name = var.bucket_name_project2
    region = var.region
    division = var.division
}

module "s3module_project3" {
    source  = "../../../modules/s3"
    bucket_name = var.bucket_name_project3
    region = var.region
    division = var.division
}

module "s3module_project4" {
    source  = "../../../modules/s3"
    bucket_name = var.bucket_name_project4
    region = var.region
    division = var.division_cadsupplychain
}

module "s3module_project5" {
    source  = "../../../modules/s3"
    bucket_name = var.bucket_name_project5
    region = var.region
    division = var.division_cadsupplychain
}

module "s3_cad_supplychain_raw_sap" {
    source  = "../../../modules/s3"
    bucket_name = var.bucket_name_cad_supplychain_raw_sap
    region = var.region
    division = var.division_cad_supplychain_raw_sap
}

