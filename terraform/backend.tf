terraform {
  backend "gcs" {
    bucket = "composer-fun-terraform-state"
    prefix = "env/dev"
  }
}