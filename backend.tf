terraform {
  backend "gcs" {
    bucket = "composer-challenges-terraform-states"
    prefix = "env/dev"
  }
}