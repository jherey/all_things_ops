### GENERAL
variable "app_name" {
  type = string
}

### ATLAS
variable "atlas_project_id" {
  type = string
}

variable "atlas_user_password" {
  type = string
}

variable "mongodbatlas_public_key" {
  type = string
}

variable "mongodbatlas_private_key" {
  type = string
}

### GCP
variable "gcp_machine_type" {
  type = string
}
