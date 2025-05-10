provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test" {
  ami                     = "ami-0f88e80871fd81e91"
  instance_type           = "t2.micro"
  subnet_id               = "subnet-070ffc20c9ce142aa"
}

# resource "aws_s3_bucket" "my_bucket" {
#     bucket = "test-backet-123456789"
    
# }

# resource "aws_dynamodb_table" "terraform_lock" {
#   name           = "terraform-lock"
#   billing_mode   = "PAY_PER_REQUEST"
#   hash_key       = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }