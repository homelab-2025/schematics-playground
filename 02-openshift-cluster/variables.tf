# Variables for IBM Cloud Provider
variable "ibmcloud_api_key" {}
variable "region" {}


# Variables for Resource Group
variable "name" {
  description = "Base name for all resources"
  default = "openshift-cluster"
  type    = string
}

variable "number_of_zones" {
  description = "Number of availability zones to use"
  default     = 2
  type        = number
}

variable "subnet_total_ips" {
  description = "Total number of IP addresses in the subnet"
  default     = 256
  type        = number
}

variable "cos_plan" {
  description = "Plan for Cloud Object Storage instance"
  default = "standard"
  type    = string  
}

variable "cos_location" {
  description = "Location for Cloud Object Storage instance"
  default = "global"
  type    = string
}

variable "openshift_cluster_version" {
  description = "OpenShift version for OpenShift cluster"
  default = "4.19.17_openshift"
  type    = string
}

variable "openshift_cluster_flavor" {
  description = "Flavor for OpenShift cluster worker nodes. The minimum flavor is bx2.4x16."
  default = "bx2.4x16"
  type    = string
}

variable "openshift_worker_count_per_zone" {
  description = "Number of worker nodes per availability zone. It will be multiplied by number_of_zones variable. Note that minimum total worker nodes is 2."
  default = 2
  type    = number
}