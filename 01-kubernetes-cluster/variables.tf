# Variables for IBM Cloud Provider
variable "ibmcloud_api_key" {}
variable "region" {}

# Variables for Resource Group
variable "resource_group_name" {
  default = "tf-rg-k8s"
  type    = string
}

variable "vpc_name" {
  default = "tf-vpc"
  type    = string
}

variable "subnet_name" {
  default = "tf-subnet"
  type    = string
}

variable "subnet_azs" {
  default = "eu-de-1"
  type    = string
}

variable "subnet_total_ips" {
  description = "Total number of IP addresses in the subnet"
  default     = 256
  type        = number
}

variable "k8s_cluster_name" {
  default = "tf-k8s-cluster"
  type    = string
}

variable "k8s_version" {
  default = "1.33.5"
  type    = string
}

variable "k8s_cluster_flavor" {
  default = "bx2.2x8" # minimum flavor for k8s cluster
  type    = string
}

variable "k8s_worker_count" {
  default = 1 # minimum 1 worker node
  type    = number
}