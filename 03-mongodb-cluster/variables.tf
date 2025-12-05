# Variables for IBM Cloud Provider
variable "ibmcloud_api_key" {}
variable "region" {}

# Variables for Resource Group
variable "name" {
  description = "Base name for all resources"
  default     = "mongo"
  type        = string
}

variable "mongodb_plan" {
  default = "enterprise"
  type = string  
}

variable "service_endpoints" {
  default = "public"
  type = string
}

variable "host_flavor" {
  default = "b3c.4x16.encrypted"
  type = string
}

variable "admin_password" {
  default = "SuperSecure_001"
  type = string
}

variable "dbuser_password" {
  default = "SuperSecure_001"
  type = string
}

variable "opsmanageruser_password" {
  default = "SuperSecure_001"
  type = string
}
