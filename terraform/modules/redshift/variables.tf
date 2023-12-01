variable "application" {
    default = "terraform"
}

variable "built_by" {
    default = "kpipartners.com"
}

variable "dd_auto_discovery" {
    default = "false"
}

variable "infrastructure_support" {
    default = "N/A"
}

variable "finance_contact" {
    default = "naveen.arigapudi@kpipartners.com"
}

variable "application_owner" {
    default = "naveen.arigapudi@kpipartners.com"
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

variable "redshiftvpccidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpcname" {
  default = "redshiftvpc"
}


# Note: Please provide multiple availability_zone if you are creating multiple subnets
variable "publicazs" {
  type = list
  default = ["ap-south-1a"]
}

# Note: Please provide multiple subnet cidr if you are creating multiple subnets
variable "publicsubnetcidr" {
  type = list
  default = ["10.0.1.0/24"]
}


variable "publicsubnetname" {
  type = string
  default = "web-publicsubnet"
}


# Note: Please provide multiple availability_zone if you are creating multiple subnets
variable "privateazs" {
  type = list
  default = ["ap-south-1b","ap-south-1c"]
}

# Note: Please provide multiple subnet cidr if you are creating multiple subnets
variable "privatesubnetcidr" {
  type = list
  default = ["10.0.2.0/24","10.0.3.0/24"]
}

variable "privatesubnetname" {
  type = string
  default = "Redshift-private-snet"
}


variable "cluster_identifier" {
    default = "redshiftcluster"
}
variable "database_name" {
    default = "redshiftdb"
}
variable "master_username" {
    type        = string
    sensitive   = true
}

variable "master_pass" {
   type        = string
   sensitive   = true
}

variable "nodetype" {
    default = "dc2.large"
}

variable "cluster_type" {
    default = "single-node"
}

variable "clustername" {
    type = "string"
    default = "Nonprod-redshift-cluster"
}



