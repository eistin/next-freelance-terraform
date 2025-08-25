terraform {
  backend "gcs" {
    bucket = "stini-tf-states"
    prefix = "infra"
  }
}

