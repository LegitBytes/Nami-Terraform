provider "kubernetes" {

    config_path = "~/.kube/config"
}
terraform {
  backend "gcs" {
    bucket  = "lyceum-terraform-backend"
    prefix  = "terraform/nami-backend-ingress-qa-state"
    credentials = "lyceum-cred.json"
  }

}


resource "kubernetes_ingress_v1" "nami-backend-ingress-qa" {
  metadata {
    name = "nami-backend-ingress-qa"
    namespace = "nami-backend-qa"
  }
  spec {
    ingress_class_name = "nginx"
    default_backend {
      service {
        name = "nami-backend-orchestration-service"
        port {
             number= 4000
       }
    }
    }
    rule {
        host = "qa.api.nami.gg"
      http {
        path {
          backend {
            service {
              name = "nami-backend-orchestration-service"
              port {
                number= 4000
              }
          }
          }
          path = "/"
        }
      }
    }
    tls {
      hosts = ["qa.api.nami.gg"]
       secret_name = "nami-backend-tls-qa"
    }
  }
}
