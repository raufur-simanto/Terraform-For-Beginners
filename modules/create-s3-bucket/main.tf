resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket

  tags = {
    Name        = var.tags
  }
  
}