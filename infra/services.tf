module "project-services" {
  source     = "github.com/eistin/tf-module-gcp-project-services.git"
  project_id = var.project_id

  enable_apis                 = true
  disable_services_on_destroy = false

  activate_apis = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "servicenetworking.googleapis.com",
    "iap.googleapis.com",
    "secretmanager.googleapis.com",
    "sqladmin.googleapis.com",
    "artifactregistry.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "run.googleapis.com",
    "domains.googleapis.com",
    "eventarc.googleapis.com",
  ]
}
