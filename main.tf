terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_storage_bucket" "sf_bucket" {
  name          = var.bucket_name
  location      = "US"
  force_destroy = true
}

resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.sf_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

resource "google_storage_bucket_object" "pdf_file" {
  name         = var.resource_name
  source       = var.resource_path
  content_type = "application/pdf"
  bucket       = google_storage_bucket.sf_bucket.id
}
