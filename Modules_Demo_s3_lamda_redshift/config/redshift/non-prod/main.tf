provider "aws" {
  region = var.region
}

module "redshift" {
 source = "../../../modules/redshift"
 master_username = var.master_username
 master_pass = var.master_pass

}
