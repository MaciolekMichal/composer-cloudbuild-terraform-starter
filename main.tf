provider "google" {
  project = var.project_id
  region  = "europe-central2"
}

resource "google_project_service" "composer_api" {
  provider = google
  project = var.project_id
  service = "composer.googleapis.com"
  disable_on_destroy = false
}

resource "google_service_account" "composer_sa" {
  provider = google
  account_id   = "composer-sa"
  display_name = "Cloud Composer Service Account"
}

resource "google_project_iam_member" "composer_sa" {
  provider = google
  project  = "composer-fun"
  member   = "serviceAccount:${google_service_account.composer_sa.email}" 
  role     = "roles/composer.worker"
}

resource "google_service_account_iam_member" "composer_sa" {
  provider = google
  service_account_id = google_service_account.composer_sa.name
  role = "roles/composer.ServiceAgentV2Ext"
  member = "serviceAccount:service-${var.project_number}@cloudcomposer-accounts.iam.gserviceaccount.com"
}

resource "google_composer_environment" "starter_environment" {
  provider = google
  name = "fun-starter-environment"
  region = "europe-central2"

  config {

    software_config {
      image_version = "composer-2.9.2-airflow-2.9.1"
    }

    node_config {
      service_account = google_service_account.composer_sa.email
    }

    environment_size  = "ENVIRONMENT_SIZE_SMALL"
  }
}
