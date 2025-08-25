output "artifact_registry_docker_base_url" {
  description = "Base URL for the Docker registry"
  value       = "${google_artifact_registry_repository.docker_repository.location}-docker.pkg.dev/${google_artifact_registry_repository.docker_repository.project}/${google_artifact_registry_repository.docker_repository.name}"
}

output "github_service_account_email" {
  description = "Email of the GitHub Actions service account"
  value       = google_service_account.github_actions.email
}

output "workload_identity_provider" {
  description = "Workload Identity Provider for GitHub Actions"
  value       = google_iam_workload_identity_pool_provider.github.name
}

output "artifact_registry_location" {
  description = "Location of the Artifact Registry"
  value       = google_artifact_registry_repository.docker_repository.location
}

output "project_id" {
  description = "Project ID"
  value       = var.project_id
}