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