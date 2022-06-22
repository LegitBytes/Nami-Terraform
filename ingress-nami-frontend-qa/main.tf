provider "kubernetes" {

    config_path = "~/.kube/config"
}
terraform {
  backend "gcs" {
    bucket  = "lyceum-terraform-backend"
    prefix  = "terraform/nami-frontend-ingress-qa-state"
    credentials = "lyceum-cred.json"
  }

}


resource "kubernetes_ingress_v1" "nami-frontend-ingress-qa" {
  metadata {
    name = "nami-frontend-ingress-qa"
    namespace = "nami-frontend-qa"
  }
  spec {
    ingress_class_name = "nginx"
    default_backend {
      service {
        name = "nami-frontend-service"
        port {
             number= 3000
       }
    }
    }
    rule {
        host = "qa.app.nami.gg"
      http {
        path {
          backend {
            service {
              name = "nami-frontend-service"
              port {
                number= 3000
              }
          }
          }
          path = "/"
        }
      }
    }
    tls {
      hosts = ["qa.app.nami.gg"]
       secret_name = "nami-frontend-qa-tls"
    }
  }
}
