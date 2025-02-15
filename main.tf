terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "~> 5.0"
        }
    }
}

provider "google" {
    project = "data-frame-451009-a1" #insert ID here
    region = "us-west1"
}

resource "google_storage_bucket" "mybucket" {
    name = "helenas_first_project_2395z578374" #ensure globally unique
    location = "us-west1"
}

output "bucket_name" {
    value = google_storage_bucket.mybucket.name
}