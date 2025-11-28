# Variables for IBM Cloud Provider
variable "ibmcloud_api_key" {}
variable "region" {}

# Variables for Resource Group
variable "resource_group_name" {
  default = "terraform-rg"
  type = string
}
