resource "google_container_cluster" "sv-cluster" {
  name               = "sv-cluster"
  network            = "default"
  location           = "us-central1-a"

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = "svora"
    password = "P@ssw0rdDontknow"

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "sv_nodes" {
  name       = "sv-node-pool"
  location   = "us-central1-a"
  cluster    = google_container_cluster.sv-cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
