terraform {
  backend "s3" {
    bucket         = "test-backet-123456789"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}