module "subnet" {
    depends_on = [
      module.vpc
    ]
    source  = "terraform-google-modules/network/google//modules/subnets"
 
    project_id   = var.project_id
    network_name = var.network_name

    subnets = [
        {
            subnet_name           = var.subnet_name
            subnet_ip             = var.subnet_ip
            subnet_region         = var.region
        },
    ]

    secondary_ranges = {
        "${var.subnet_name}" = [
            {
                range_name    = var.pods_range_name
                ip_cidr_range = var.pods_ip_cidr
            },
             {
                range_name    = var.services_range_name
                ip_cidr_range = var.services_ip_cidr
            },
        ]
    }
}
