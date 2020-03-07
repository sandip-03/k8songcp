resource "google_container_cluster" "sv-cluster" {
  name               = "sv-cluster"
  network            = "default"
  zone               = "us-central-1a"

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = "svora"
    password = "P@ssw0rd1"

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}
