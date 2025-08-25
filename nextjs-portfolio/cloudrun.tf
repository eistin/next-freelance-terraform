resource "google_service_account" "nextjs_portfolio" {
  account_id   = "nextjs-portfolio"
  display_name = "NextJS Portfolio CloudRun Service Account"
  description  = "Service Account for NextJS Portfolio CloudRun - Managed by Terraform"
}

module "nextjs_portfolio" {
  source = "github.com/eistin/tf-module-gcp-cloudrun.git"

  project_id           = var.project_id
  image                = "gcr.io/cloudrun/hello" # Default image, will be replaced by GitHub Actions
  port                 = 3000
  service_name         = "nextjs-portfolio"
  service_account_mail = google_service_account.nextjs_portfolio.email
  is_public            = true
  max_instance_count   = 2
  min_instance_count   = 1
  cpu_limit            = "500m"
  memory_limit         = "256Mi"
  location             = var.region

  # Minimal environment variables for a portfolio landing page
  env_vars = {
    "NODE_ENV" = "production"
  }
}