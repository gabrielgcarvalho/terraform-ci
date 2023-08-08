terraform {
  backend "s3" {
    acl                  = "bucket-owner-full-control"
    bucket               = "cloud-infrastructure-hub-terraform-state"
    dynamodb_table       = "cloud-infrastructure-hub-terraform-state-lock"
    encrypt              = true
    key                  = "terraform.tfstate"
    workspace_key_prefix = "gabrielgcarvalho/projects/terraform-ci" # This will store the object as gabrielgcarvalho/projects/terraform-ci/${workspace}/terraform.tfstate
    region               = "us-east-2"
  }
}