terraform {
  backend "gcs" {
    bucket = "stini-tf-states"
    prefix = "nextjs-portfolio"
  }
}

