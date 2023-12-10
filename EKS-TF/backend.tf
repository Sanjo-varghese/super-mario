terraform {
  backend "s3" {
    bucket = "sanjovarghese" # Replace with your actual S3 bucket name
    key    = "smitha/terraform.tfstate"
    region = "us-east-2"
  }
}
