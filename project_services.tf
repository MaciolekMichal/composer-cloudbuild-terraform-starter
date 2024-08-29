resource "google_project_service" "composer_api" {
  provider = google
  project = var.project_id
  service = "composer.googleapis.com"
  disable_on_destroy = false
}