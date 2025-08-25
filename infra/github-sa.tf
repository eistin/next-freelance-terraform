resource "google_service_account" "github_actions" {
  account_id   = "github-actions"
  display_name = "Github Actions"
  description  = "Service Account used by Github Actions - Managed by Terraform"
}

resource "google_project_iam_member" "github_iam_artifact_writer" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_project_iam_member" "github_iam_run_admin" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_project_iam_member" "github_iam_storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_project_iam_member" "github_iam_sa_actAs" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_service_account_iam_member" "github_workloadIdentityUser_iam_member" {
  service_account_id = google_service_account.github_actions.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.global.name}/attribute.org/eistin"
}

# Additional permissions for Artifact Registry
resource "google_artifact_registry_repository_iam_member" "github_artifact_writer" {
  project    = var.project_id
  location   = google_artifact_registry_repository.docker_repository.location
  repository = google_artifact_registry_repository.docker_repository.name
  role       = "roles/artifactregistry.writer"
  member     = "serviceAccount:${google_service_account.github_actions.email}"
}
