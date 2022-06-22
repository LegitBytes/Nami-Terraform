provider "kubernetes" {

    config_path = "~/.kube/config"
}
terraform {
  backend "gcs" {
    bucket  = "lyceum-terraform-backend"
    prefix  = "terraform/nami-backend-ingress-dev-state"
    credentials = "lyceum-cred.json"
  }

}


resource "kubernetes_ingress_v1" "nami-backend-ingress-dev" {
  metadata {
    name = "nami-backend-ingress-dev"
    namespace = "nami-backend-dev"
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
        host = "dev.api.nami.gg"
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
      hosts = ["dev.api.nami.gg"]
       secret_name = "nami-backend-dev-tls"
    }
  }
}
