resource "google_iam_workload_identity_pool" "global" {
  project = var.project_id

  workload_identity_pool_id = "global-pool"
  display_name              = "Global Cloud"
  description               = "Identity pool Workload Federation - Managed by Terraform"
  disabled                  = false
}


### Github provider
resource "google_iam_workload_identity_pool_provider" "github" {
  project = var.project_id

  workload_identity_pool_id          = google_iam_workload_identity_pool.global.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-provider"
  display_name                       = "Github"
  description                        = "OIDC identity pool provider for use by Github - Managed by Terraform"
  disabled                           = false
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
    "attribute.org"        = "assertion.repository_owner"
  }

  attribute_condition = "attribute.org == \"eistin\""
}
