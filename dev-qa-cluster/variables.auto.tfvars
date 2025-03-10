project_id                =  "lyceum-88ddb"
region                    = "us-central1"
zone                      =  "us-central1-c"
network_name              = "lyceum-network-dev-qa"
subnet_name               = "lyceum-subnet-1-dev-qa"
subnet_ip                 = "10.40.0.0/16"
cluster_name              = "lyceum-cluster-dev-qa"
nodepool1_name            =  "lyceum-node-pool-1-dev-qa"
nodepool2_name            =  "lyceum-gitlab-runners-pool-dev-qa"
machine_type              = "e2-medium"
machine_type_2            = "e2-standard-2"
min_count                 = 1
max_count                 = 3
disk_size_gb              = 100
service_account           = "lyceum-88ddb@appspot.gserviceaccount.com"
initial_node_count        = 1
pods_range_name           = "subnet-01-secondary-pods"
services_range_name       = "subnet-01-secondary-service"
pods_ip_cidr              = "10.41.0.0/16"
services_ip_cidr          = "10.42.0.0/16"