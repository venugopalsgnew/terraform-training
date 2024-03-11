variable "bucket_name" {
   type        = string
   description = "S3 bucket name"
   default     = "s3bucket-22dec2020-1"
}

variable "application" {
    default = "terraform"
}

variable "built_by" {
    default = "my.com"
}

variable "dd_auto_discovery" {
    default = "false"
}

variable "infrastructure_support" {
    default = "N/A"
}

variable "finance_contact" {
    default = "alejanota@my.com"
}

variable "application_owner" {
    default = "prasatala@my.com"
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
    default = "LSUS"
}

variable "costcenter" {
    type = number
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

variable "bucket_name_project2" {
}

variable "bucket_name_project3" {
}

variable "bucket_name_project4" {
}

variable "division_cadsupplychain" {
}

variable "bucket_name_project5" {
   }

variable "bucket_name_cad_supplychain_raw_sap" {}
variable "division_cad_supplychain_raw_sap" {}


