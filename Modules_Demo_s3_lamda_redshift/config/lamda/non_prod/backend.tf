terraform {
  backend "remote" {
    organization = "thermofisher-demo"

    workspaces {
      name = "lamda_new"
    }
  }
}
