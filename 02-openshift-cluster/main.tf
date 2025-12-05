locals {
  name = var.name
}

resource "ibm_resource_group" "resource_group" {
  name = "${local.name}-rg"
}

resource "ibm_is_vpc" "vpc" {
  name           = "${local.name}-vpc"
  resource_group = ibm_resource_group.resource_group.id
}

resource "ibm_is_public_gateway" "public_gateway" {
  count = var.number_of_zones
  name = "${local.name}-pg-${count.index + 1}"
  resource_group = ibm_resource_group.resource_group.id
  vpc  = ibm_is_vpc.vpc.id
  zone = "${var.region}-${count.index + 1}"
}

resource "ibm_is_subnet" "subnet" {
  count = var.number_of_zones
  name                     = "${local.name}-sn-${count.index + 1}"
  vpc                      = ibm_is_vpc.vpc.id
  zone                     = "${var.region}-${count.index + 1}"
  total_ipv4_address_count = var.subnet_total_ips
  resource_group           = ibm_resource_group.resource_group.id
  public_gateway           = ibm_is_public_gateway.public_gateway[count.index].id
}

resource "ibm_resource_instance" "cos_instance" {
  name     = "${local.name}-cos"
  resource_group_id = ibm_resource_group.resource_group.id
  service  = "cloud-object-storage"
  plan     = var.cos_plan
  location = var.cos_location
}

resource "ibm_container_vpc_cluster" "openshift_cluster" {
  name              = "${local.name}"
  vpc_id            = ibm_is_vpc.vpc.id
  kube_version      = var.openshift_cluster_version
  flavor            = var.openshift_cluster_flavor
  worker_count      = var.openshift_worker_count_per_zone
  cos_instance_crn  = ibm_resource_instance.cos_instance.crn
  resource_group_id = ibm_resource_group.resource_group.id
  disable_outbound_traffic_protection = true
  dynamic "zones" {
    for_each = ibm_is_subnet.subnet
    content {
      name      = zones.value.zone
      subnet_id = zones.value.id
    }
  }
}