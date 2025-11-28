output "resource_group_id" {
  value = ibm_resource_group.resource_group.id
}

output "vpc_id" {
  value = ibm_is_vpc.vpc.id
}

output "public_gateway_id" {
  value = ibm_is_public_gateway.public_gateway.id
}

output "subnet_id" {
  value = ibm_is_subnet.subnet.id
}

output "cos_id" {
  value = ibm_resource_instance.cos_instance.id
}

output "openshift_cluster_id" {
  value = ibm_container_vpc_cluster.openshift_cluster.id
}