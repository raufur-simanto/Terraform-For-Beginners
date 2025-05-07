variable "bucket" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "my-unique-bucket-name-7770"
  
}

variable "tags" {
  description = "Tags for the S3 bucket"
  type        = string
  default     = "my-unique-bucket-name-7770"
  
}
module "create-s3-bucket" {
  source = "./create-s3-bucket"
  bucket = var.bucket
  tags   = var.tags
}