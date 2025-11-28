resource "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

resource "ibm_is_vpc" "vpc" {
  name           = var.vpc_name
  resource_group = ibm_resource_group.resource_group.id
}

resource "ibm_is_public_gateway" "public_gateway" {
  name = var.public_gateway_name
  resource_group = ibm_resource_group.resource_group.id
  vpc  = ibm_is_vpc.vpc.id
  zone = var.subnet_azs
}

resource "ibm_is_subnet" "subnet" {
  name                     = var.subnet_name
  vpc                      = ibm_is_vpc.vpc.id
  zone                     = var.subnet_azs
  total_ipv4_address_count = var.subnet_total_ips
  resource_group           = ibm_resource_group.resource_group.id
  public_gateway           = ibm_is_public_gateway.public_gateway.id
}

resource "ibm_resource_instance" "cos_instance" {
  name     = var.cos_name
  resource_group_id = ibm_resource_group.resource_group.id
  service  = "cloud-object-storage"
  plan     = var.cos_plan
  location = var.cos_location
}

resource "ibm_container_vpc_cluster" "openshift_cluster" {
  name              = var.openshift_cluster_name
  vpc_id            = ibm_is_vpc.vpc.id
  kube_version      = var.openshift_cluster_version
  flavor            = var.openshift_cluster_flavor
  worker_count      = var.openshift_worker_count
  cos_instance_crn  = ibm_resource_instance.cos_instance.crn
  resource_group_id = ibm_resource_group.resource_group.id
  disable_public_service_endpoint = true
  zones {
      subnet_id = ibm_is_subnet.subnet.id
      name      = var.subnet_azs
    }
}