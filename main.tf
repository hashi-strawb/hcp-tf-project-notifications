terraform {
  cloud {
    organization = "fancycorp"

    workspaces {
      name = "hcp-tf-project-notifications"
    }
  }
}

provider "tfe" {
  organization = var.tfe_organization
}


data "tfe_projects" "all" {
}


# TODO: need a project-level notification resource
# https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/notification_configuration


