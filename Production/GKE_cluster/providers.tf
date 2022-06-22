provider "google" {
  credentials = file("lyceum-cred.json")

  project = var.project_id
  region  = var.region
  zone    =  var.zone
}

provider "google-beta" {
 
  credentials = file("lyceum-cred.json")
  project     = var.project_id
}
