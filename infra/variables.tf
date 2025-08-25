variable "project_id" {
  type        = string
  description = "The ID of the GCP project"
  default     = "stini-326916"
}

variable "region" {
  description = "The default region to manage resources in"
  type        = string
  default     = "europe-west1"
}
