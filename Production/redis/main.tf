terraform {
 
  backend "gcs" {
    bucket  = "lyceum-terraform-backend"
    prefix  = "terraform/redis-state-prod"
    credentials = "lyceum-cred.json"
  }

}




provider "helm" {

  kubernetes {
    config_path = "~/.kube/config"
  }
}



resource "helm_release" "redis-helm" {
  name       = "redis-lyceum-nami"
  namespace  = "redis"
  create_namespace = true
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "redis"
  

values = [
    "${file("values.yaml")}"
  ]



   set {
     name = "persistence.storageClass"
     value = "default"
   }
    set {
     name = "volumePermissions.enabled"
     value = true
   }
}


