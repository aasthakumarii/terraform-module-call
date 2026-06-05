terraform {
  backend "s3" {
    bucket = "tf-student-registration-123"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
