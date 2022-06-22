variable "project_id" {
  type        = string
  description = "The project ID to create the cluster."
}

variable "region" {
  type        = string
  description = "The region to create the cluster."
}

variable "zone" {
  type        = string
  description = "The zone to create the cluster."
}

variable "network_name" {
  type        = string
  description = "The name of the cluster."
}

variable "subnet_name" {
  type        = string
  description = "Type of the node compute engines."
}

variable "subnet_ip" {
  type        = string
  description = "Type of the node compute engines."
}

variable "cluster_name" {
  type        = string
  description = "Name of the cluster"
}

variable "nodepool1_name" {
  type        = string
  description = "Name of the node pool 1"
}

variable "nodepool2_name" {
  type        = string
  description = "Name of the node pool 2"
}

variable "machine_type" {
  type        = string
  description = "type of the instance"
}

variable "min_count" {
  type        = number
  description = "Minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count."
}

variable "max_count" {
  type        = number
  description = "Maximum number of nodes in the NodePool. Must be >= min_node_count."
}

variable "disk_size_gb" {
  type        = number
  description = "Size of the node's disk."
}
variable "service_account" {
  type        = string
  description = "Service account used to create cluster"
}


variable "initial_node_count" {
  type        = number
  description = "The number of nodes to create in this cluster's default node pool."
}

variable "pods_range_name" {
  type = string
  description = "Name of the pods range"
  
}

variable "pods_ip_cidr" {
  type = string
  description = "Ip cidr of pods"
  
}

variable "services_range_name" {
  type = string
  description = "Name of the service range"
  
}
variable "services_ip_cidr" {
  type = string
  description = "Ip cidr of services"
  
}