terraform {
  cloud {
    organization = "fancycorp"

    workspaces {
      name = "hcp-tf-project-notifications"
    }
  }

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.78.0"
    }
  }
}

provider "tfe" {
  organization = var.tfe_organization
}


data "tfe_projects" "all" {
}

resource "tfe_project_notification_configuration" "slack" {
  for_each = {
    for project in data.tfe_projects.all.projects :
    project.id => project
  }

  name             = "Health Checks"
  enabled          = true
  destination_type = "slack"
  triggers = [
    "assessment:check_failure",
    "assessment:drifted",
    "assessment:failed",
    "run:errored",
    "run:needs_attention",
  ]
  url        = var.slack_webhook
  project_id = each.value.id

  # Currently a bug in the provider, so this enters an error loop
  # # https://ibm-hashicorp.slack.com/archives/C09KXBVANR4/p1781700262712149
}
