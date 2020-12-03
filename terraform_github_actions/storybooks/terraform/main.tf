terraform {
  backend "gcs" {
    bucket = "devops-traversy-297413-terraform"
    prefix = "/state/storybooks"
  }
}
