locals {
  name = var.name
}

resource "ibm_resource_group" "resource_group" {
  name = "${local.name}-rg"
}

resource "ibm_database" "mongodb" {
  resource_group_id = ibm_resource_group.resource_group.id
  name              = "${local.name}"
  service           = "databases-for-mongodb"
  plan              = var.mongodb_plan
  location          = var.region
  adminpassword     = var.admin_password
  service_endpoints = var.service_endpoints
  group {
    group_id = "member"
    host_flavor {
      id = var.host_flavor
    }
    # Specify configuration if needed here
  }
  users {
    name     = "dbuser"
    password = var.dbuser_password
    type     = "database"
  }
  users {
    name     = "opsmanageruser"
    password = var.opsmanageruser_password
    type     = "ops_manager"
    role     = "group_data_access_admin"
  }
}