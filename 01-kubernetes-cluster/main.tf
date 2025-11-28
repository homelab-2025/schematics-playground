resource "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

resource "ibm_is_vpc" "vpc" {
  name           = var.vpc_name
  resource_group = ibm_resource_group.resource_group.id
}

resource "ibm_is_subnet" "subnet" {
  name                     = var.subnet_name
  vpc                      = ibm_is_vpc.vpc.id
  zone                     = var.subnet_azs
  total_ipv4_address_count = var.subnet_total_ips
  resource_group           = ibm_resource_group.resource_group.id
}

resource "ibm_container_vpc_cluster" "k8s_cluster" {
  name              = var.k8s_cluster_name
  vpc_id            = ibm_is_vpc.vpc.id
  kube_version      = var.k8s_version
  flavor            = var.k8s_cluster_flavor
  worker_count      = var.k8s_worker_count
  resource_group_id = ibm_resource_group.resource_group.id
  zones {
    subnet_id = ibm_is_subnet.subnet.id
    name      = var.subnet_azs
  }
}