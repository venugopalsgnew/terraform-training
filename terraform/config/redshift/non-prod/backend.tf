terraform {
  backend "remote" {
    organization = "Test123456_24Nov"

    workspaces {
      name = "redshift-nonprod"
    }
  }
}
