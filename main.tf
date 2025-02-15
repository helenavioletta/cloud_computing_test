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
    
    versioning {
        enabled = true
    }

    labels = {
        environment = "student-lab"
        managed_by = "terraform"
    }
}

resource "google_storage_bucket_iam_binding" "example_binding" {
    bucket = google_storage_bucket.mybucket.name
    role = "roles/storage.objectUser"

    members = [
        "user:francesshang3010@gmail.com"
    ]
}
output "bucket_name" {
    value = google_storage_bucket.mybucket.name
}