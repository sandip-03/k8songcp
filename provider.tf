provider "google" {
  credentials = "${file("./creds/account.json")}"
  project     = "My First Project"
  region      = "us-central1"
}
