output "resource_group_id" {
  value = ibm_resource_group.resource_group.id
}

output "vpc_id" {
  value = ibm_is_vpc.vpc.id
}

output "subnet_id" {
  value = ibm_is_subnet.subnet.id  
}

output "k8s_cluster_id" {
  value = ibm_container_vpc_cluster.k8s_cluster.id
}