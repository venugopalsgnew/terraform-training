variable "token" {}

variable "host" {
    default = "https://dbc-e4474a08-6d6d.cloud.databricks.com/" 
}
variable "cluster_name" {
    description = "Name of the databricks cluster"
    default = "Autoscalingcluster"
}

variable "spark_version" {
     default = "6.6.x-scala2.11"
}

variable "autotermination_minutes" {
    type = number
    default = 10
}

variable "min_workers" {
    type = number
    default = 1
}


variable "max_workers" {
    type = number
    default = 2
}

