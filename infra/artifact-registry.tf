resource "google_artifact_registry_repository" "docker_repository" {
  location      = var.region
  repository_id = "nextjs-portfolio"
  description   = "NextJS Portfolio Docker repository"
  format        = "DOCKER"

  lifecycle {
    prevent_destroy = true
  }
}
