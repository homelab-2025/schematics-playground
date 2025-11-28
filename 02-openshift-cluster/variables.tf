# Variables for IBM Cloud Provider
variable "ibmcloud_api_key" {}
variable "region" {}

# Variables for Resource Group
variable "resource_group_name" {
  default = "tf-rg-oc"
  type    = string
}

variable "vpc_name" {
  default = "tf-vpc-oc"
  type    = string
}

variable "public_gateway_name" {
  default = "tf-pgw-oc"
  type    = string
}
variable "subnet_name" {
  default = "tf-subnet-oc"
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

variable "cos_name" {
  default = "tf-cos-oc"
}

variable "cos_plan" {
  default = "standard"  
}

variable "cos_location" {
  default = "global"
}

variable "openshift_cluster_name" {
  default = "tf-cluster-oc"
  type    = string
}

variable "openshift_cluster_version" {
  default = "4.19.17_openshift"
  type    = string
}

variable "openshift_cluster_flavor" {
  default = "bx2.4x16" # minimum flavor is bx2.4x16 for OpenShift cluster
  type    = string
}

variable "openshift_worker_count" {
  default = 2 # minimum 2 worker node
  type    = number
}