provider "mongodbatlas" {
  public_key = var.mongodbatlas_public_key
  private_key  = var.mongodbatlas_private_key
  # version = "~> 0.6"
}

# CLUSTER
resource "mongodbatlas_cluster" "mongo_cluster" {
  project_id   = var.atlas_project_id
  name         = "${var.app_name}-${terraform.workspace}"
  num_shards   = 1

  replication_factor           = 3
  provider_backup_enabled      = true
  auto_scaling_disk_gb_enabled = true
  mongo_db_major_version       = "3.6"

  //Provider Settings "block"
  provider_name               = "AWS"
  disk_size_gb                = 10
  # provider_disk_iops          = 300
  # provider_volume_type        = "STANDARD"
  # provider_encrypt_ebs_volume = true
  provider_instance_size_name = "M10"
  provider_region_name        = "CENTRAL_US"
}

# DB USER
resource "mongodbatlas_database_user" "mongo_user" {
  username           = "storybooks-user-${terraform.workspace}"
  password           = var.atlas_user_password
  project_id         = var.atlas_project_id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = "storybooks"
  }
}

# IP WHITELIST
resource "mongodbatlas_project_ip_whitelist" "test" {
  project_id = var.atlas_project_id
  ip_address = google_compute_address.ip_address.address
}
