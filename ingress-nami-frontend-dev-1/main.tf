provider "kubernetes" {

    config_path = "~/.kube/config"
}
terraform {
  backend "gcs" {
    bucket  = "lyceum-terraform-backend"
    prefix  = "terraform/nami-frontend-ingress-dev-state"
    credentials = "lyceum-cred.json"
  }

}


resource "kubernetes_ingress_v1" "nami-frontend-ingress-dev" {
  metadata {
    name = "nami-frontend-ingress-dev"
    namespace = "nami-frontend-dev"
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
        host = "dev.app.nami.gg"
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
      hosts = ["dev.app.nami.gg"]
       secret_name = "nami-frontend-dev-tls"
    }
  }
}
