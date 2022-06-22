provider "kubernetes" {

    config_path = "~/.kube/config"
}
terraform {
  backend "gcs" {
    bucket  = "lyceum-terraform-backend"
    prefix  = "terraform/nami-prod-ingress-frontend-state"
    credentials = "lyceum-cred.json"
  }

}



resource "kubernetes_ingress_v1" "nami-frontend-ingress-prod" {
  metadata {
    name = "nami-frontend-ingress-prod"
    namespace = "nami-frontend-prod"
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
        host = "app.nami.gg"
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
      hosts = ["app.nami.gg"]
       secret_name = "nami-frontend-tls-prod"
    }
  }
}
