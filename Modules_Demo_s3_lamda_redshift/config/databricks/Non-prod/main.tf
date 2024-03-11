module "databricks" {
    source = "../../../modules/databricks"
    cluster_name = var.cluster_name
    token        = var.token
}
