provider "helm" {

  kubernetes {
    config_path = "~/.kube/config"
  }
}
terraform {
  backend "gcs" {
    bucket  = "lyceum-terraform-backend"
    prefix  = "terraform/nami-prod-mongodb-state"
    credentials = "lyceum-cred.json"
  }

}



resource "helm_release" "mongodb_helm" {
  name       = "mongodb-nami"
  namespace  ="mongo-nami-prod"
  #version = 10.10
  create_namespace = true
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mongodb"


values = [
    "${file("chart-values/values.yaml")}"
  ]
  set{
    name  = "replicaCount"
    value = "3"
    }
  set{
name  = "auth.rootPassword"
    value = "Lyc3um_L3g1t"
    }
  set{
    name = "readinessProbe.initialDelaySeconds"
    value = "360"
  }
   set{
    name = "livenessProbe.initialDelaySeconds"
    value = "360"
  }
  set {
    name = "auth.username"
    value = "lyceum-mongo-db"
  }
  set{
    name = "auth.password"
    value = "Lyc3um_mon30"
  }
  set{
    name = "auth.database"
    value = "auth-db"
  }
  set{
    name= "serviceAccount.create"
    value= true
  }
  set{
    name= "rbac.create"
    value= true
  }
 set{
    name = "architecture"
    value = "replicaset"
  }
  set{
    name = "auth.replicaSetKey"
    value = "gkelyceumsetkey"
  }
}


