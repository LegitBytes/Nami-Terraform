provider "helm" {

  kubernetes {
    config_path = "~/.kube/config"
  }
}
terraform {
  backend "gcs" {
    bucket  = "lyceum-terraform-backend"
    prefix  = "terraform/nami-mongodb-qa-state"
    credentials = "lyceum-cred.json"
  }
}




resource "helm_release" "mongodb_helm" {
  name       = "mongodb-nami"
  namespace  ="mongo-nami-qa"
  #version = 10.10
  create_namespace = true
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mongodb"


values = [
    "${file("values2.yaml")}"
  ]

  set{
name  = "auth.rootPassword"
    value = "Lyc3um_L3g1t"
    }

 
  set {
    name = "auth.username"
    value = "lyceum-mongo-db"
  }
  set{
     name=  "replicaSetConfigurationSettings.enabled"
     value =false 
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
    name = "replicaCount"
    value = "3"
  }
    set{
    name = "auth.replicaSetKey"
    value = "gkelyceumsetkey"
  }
}


