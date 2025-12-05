output "resource_group_id" {
  value = ibm_resource_group.resource_group.id  
}

output "database_id" {
  value = ibm_database.mongodb.id
}

data "ibm_database_connection" "mongodb_conn" {
  deployment_id = ibm_database.mongodb.id
  user_id       = ibm_database.mongodb.adminuser
  user_type     = "database"  
  endpoint_type = var.service_endpoints
}

output "mongodb_connection" {
  value  = data.ibm_database_connection.mongodb_conn.mongodb
}
