terraform {
  backend "s3" {
    bucket = "my-unique-bucket-darshan-2025"
    key = "terraform.tfstate"
    region = "eu-north-1"
    use_lockfile = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
