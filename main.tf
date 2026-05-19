terraform {
  cloud {
    organization = "fancycorp"

    workspaces {
      name = "hcp-tf-project-notifications"
    }
  }
}

