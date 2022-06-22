provider "kubernetes" {

    config_path = "~/.kube/config"
}
terraform {
  backend "gcs" {
    bucket  = "lyceum-terraform-backend"
    prefix  = "terraform/nami-prod-ingress-backend-state"
    credentials = "lyceum-cred.json"
  }

}


resource "kubernetes_ingress_v1" "nami-backend-ingress-prod" {
  metadata {
    name = "nami-backend-ingress-prod"
    namespace = "nami-backend-prod"
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
        host = "api.nami.gg"
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
      hosts = ["api.nami.gg"]
       secret_name = "nami-backend-tls-prod"
    }
  }
}
