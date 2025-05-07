
output s3_arn {
  value = aws_s3_bucket.my_bucket.arn
  description = "The ARN of the S3 bucket"
}
output s3_bucket_name {
  value = aws_s3_bucket.my_bucket.bucket
  description = "The name of the S3 bucket"
}
output s3_region {
  value = aws_s3_bucket.my_bucket.region
  description = "The region of the S3 bucket"
}
