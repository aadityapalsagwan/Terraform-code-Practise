output "bucket_name" {

  value = aws_s3_bucket.bucket.bucket
}

output "bucket_arn" {

  value = aws_s3_bucket.bucket.arn
}

output "website_url" {

  value = aws_s3_bucket_website_configuration.website.website_endpoint
}