
module "gke" {
  
 depends_on = [
   module.subnet
 ]
  create_service_account     = false
  default_max_pods_per_node  = 55
  remove_default_node_pool   = true
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id                 = var.project_id
  name                       = var.cluster_name
  region                     = var.region
  zones                      = ["us-east1-c", "us-east1-b", "us-east1-d"]
  network                    = var.network_name
  subnetwork                 = var.subnet_name
  ip_range_pods              = "subnet-01-secondary-pods"
  ip_range_services          = "subnet-01-secondary-service"
  http_load_balancing        = false
  horizontal_pod_autoscaling = true
  network_policy             = false

  node_pools = [
    {
      name                      = var.nodepool1_name 
      autoscaling               = true
      machine_type              = var.machine_type
      node_locations            = "us-east1-b,us-east1-c"
      min_count                 = var.min_count
      max_count                 = var.max_count
      local_ssd_count           = 0
      disk_size_gb              = var.disk_size_gb
      disk_type                 = "pd-standard"
      image_type                = "COS_CONTAINERD"
      auto_repair               = true
      auto_upgrade              = true
      service_account           = var.service_account
      preemptible               = false
      initial_node_count        = var.initial_node_count
    },
   {
      name                      = var.nodepool2_name 
      autoscaling               = false
      machine_type              = var.machine_type
      node_locations            = "us-east1-b,us-east1-c"
      min_count                 = var.min_count
      max_count                 = var.max_count
      local_ssd_count           = 0
      disk_size_gb              = var.disk_size_gb
      disk_type                 = "pd-standard"
      image_type                = "COS_CONTAINERD"
      auto_repair               = true
      auto_upgrade              = true
      service_account           = var.service_account
      preemptible               = false
      initial_node_count        = var.initial_node_count
    },
    
  ]

 
}