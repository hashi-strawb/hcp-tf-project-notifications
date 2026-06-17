variable "tfe_organization" {
  default = "fancycorp"
}

variable "slack_webhook" {
  type = string

  # https://lmhd.slack.com/services/B03RGJTJG1K
  # add to secrets.auto.tfvars
}
