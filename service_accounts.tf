resource "google_service_account" "initial_composer_sa" {
  provider = google
  account_id   = "composer-sa"
  display_name = "Cloud Composer Service Account"
}

resource "google_project_iam_member" "composer_sa" {
  provider = google
  project  = var.project_id
  member   = "serviceAccount:${google_service_account.initial_composer_sa.email}" 
  role     = "roles/composer.worker"

  depends_on = [google_service_account.initial_composer_sa]
}

# resource "google_service_account_iam_member" "composer_sa" {
#   provider = google
#   service_account_id = google_service_account.composer_sa.name
#   role = "roles/composer.ServiceAgentV2Ext"
#   member = "serviceAccount:service-${var.project_number}@cloudcomposer-accounts.iam.gserviceaccount.com"
# }