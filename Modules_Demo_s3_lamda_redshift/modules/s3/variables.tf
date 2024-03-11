variable "bucket_name" {
   type        = string
   description = "S3 bucket name"
   default     = "s3bucket-22dec2020-1"
}

variable "application" {
    default = "terraform"
}

variable "built_by" {
    default = "jitendra.punjabi@thermofisher.com"
}

variable "dd_auto_discovery" {
    default = "false"
}

variable "infrastructure_support" {
    default = "N/A"
}

variable "finance_contact" {
    default = "N/A"
}

variable "application_owner" {
    default = "prasada.martala@thermofisher.com"
}

variable "tranche" {
    default = "ETO"
}

variable "environment" {
    default = "test"
}

variable "application_support" {
    default = "N/A"
}

variable "project_number" {
    default = "N/A"
}

variable "compliance" {
    default = "N/A"
}

variable "hfm_entity" {
    default = "N/A"
}

variable "costcenter" {
    default = "0"
}

variable "group" {
    default = "ETO"
}


variable "rightsizing_exception" {
    default = "false"
}

variable "division" {
   default = "N/A"
}

variable "region" {}

variable "arns" {
  type = list
  default = ["arn:aws:iam::096654394133:role/TFS-Databricks-EC2Role-BIDL-DETier1"]
}

/*
variable "target_bucketname" {
  default = "s3://tfsdl-corp-s3analytics-test/${aws_s3_bucket.imports3.id}"
}

*/
