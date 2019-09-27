// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("credentials.json")}"
 project     = "[project_id]"
 region      = "[region]"
}


resource "google_cloudbuild_trigger" "filename-trigger" {
  trigger_template {
    branch_name = "master"
    repo_name   = "[cloud_source_repo]"
  }
  filename = "cloudbuild.yaml"
}