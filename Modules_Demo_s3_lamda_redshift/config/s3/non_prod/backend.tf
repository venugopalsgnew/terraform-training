# set terraform workspace in local execution mode only.

terraform {
  backend "remote" {
    organization = "thermofisher-demo"

    workspaces {
      name = "s3-nonprod-workspace"
    }
  }
}

