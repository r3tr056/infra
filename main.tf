provider "google" {
  credentials = file("<CREDS_FILE_PATH>")
  project     = "ecoview"
  # Adjust the region based on deployment requirements
  region = "ap-south-1"
}

resource "google_container_cluster" "gke_cluster" {
  name     = "eocview-cluster"
  location = "ap-south-1"

  initial_node_count = 2

  node_config {
    # Adjust the machine type based on the requirements
    machine_type = "n1-standard-4"
  }
}

provider "kubernetes" {
  config_path = file("<PATH_TO_KUBE_CONFIG>")
}

resource "kubernetes_namespace" "ecoview-namespace" {
  metadata {
    name = "ecoview"
  }
}
