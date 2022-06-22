provider "helm" {

  kubernetes {
    config_path = "~/.kube/config"
  }
}
terraform {
  backend "gcs" {
    bucket  = "lyceum-terraform-backend"
    prefix  = "terraform/nami-prod-runners-state"
    credentials = "lyceum-cred.json"
  }

}

resource "helm_release" "gitlab-runner-lyceum-qa" {
  name       = "lyceum-gitlab-runners"
  repository = "https://charts.gitlab.io"
  chart      = "gitlab-runner"
  #version    = "6.0.1"
 # create_namespace = true
  namespace = "gitlab-runners"
   set{
     name = "nodeseletor.cloud.google.com/gke-nodepool"
     value = "lyceum-gitlab-runners-pool-prod"
     
   }
  

  values = [
    "${file("values.yaml")}"]
}
