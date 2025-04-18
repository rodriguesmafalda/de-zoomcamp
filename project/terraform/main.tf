terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

provider "google" {
  #credentials = file("/Users/mafalda.rodrigues/.gc/keys/my-creds.json")
  project     = var.project
  region      = var.region
}


resource "google_storage_bucket" "public-life-data-seattle-bucket" {
  name          = var.gcs_bucket_name
  location      = var.location
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "public_life_data_seattle_dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.location
}
