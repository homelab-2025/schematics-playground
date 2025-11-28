# Variables for IBM Cloud Provider
variable "ibmcloud_api_key" {}
variable "region" {}

# Variables for Resource Group
variable "resource_group_name" {
  default = "tf-rg-k8s"
}

variable "vpc_name" {
  default = "tf-vpc"
}

variable "subnet_name" {
  default = "tf-subnet"
}

variable "subnet_azs" {
  default = "eu-de-1"
}

variable "k8s_cluster_name" {
  default = "tf-k8s-cluster"
}

variable "k8s_version" {
  default = "1.33.5" 
}

variable "k8s_cluster_flavor" {
  default = "bx2.2x8" # minimum flavor for k8s cluster
}

variable "k8s_worker_count" {
    default = 1  # minimum 1 worker node
}