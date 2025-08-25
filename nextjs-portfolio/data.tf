data "google_project" "project" {}

data "terraform_remote_state" "infra" {
  backend = "gcs"
  config = {
    bucket = var.terraform_state_bucket
    prefix = "infra"
  }
}

locals {
  artifact_registry_docker_base_url = data.terraform_remote_state.infra.outputs.artifact_registry_docker_base_url
}