terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.11.0"
    }
  }
  backend "gcs" {
    bucket  = "lyceum-terraform-backend"
    prefix  = "terraform/lyceum-prod-new-cluster-state"
    credentials ="lyceum-cred.json"
  }

}
