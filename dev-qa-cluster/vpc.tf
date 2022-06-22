module "vpc" {
    source  = "terraform-google-modules/network/google//modules/vpc"
 

    project_id   = var.project_id
    network_name = var.network_name

    shared_vpc_host = false
}
