variable "project_id" {
  type        = string
  description = "The ID of the GCP project"
}

variable "region" {
  description = "The default region to manage resources in"
  type        = string
  default     = "europe-west1"
}

variable "terraform_state_bucket" {
  description = "GCS bucket name for Terraform state"
  type        = string
}