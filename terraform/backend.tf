terraform {
  backend "gcs" {
    bucket = "composer-challenges-terraform-state"
    prefix = "env/dev"
  }
}