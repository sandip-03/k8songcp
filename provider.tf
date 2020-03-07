provider "google" {
  credentials = "${file("./cred/account.json")}"
  project     = "turnkey-channel-270404"
  region      = "us-central1"
  zone        = "us-central1-a"
}
