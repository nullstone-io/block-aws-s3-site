output "bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = "string ||| The ARN of the created S3 bucket."
}

output "bucket_name" {
  value       = aws_s3_bucket.this.bucket
  description = "string ||| The name of the created S3 bucket."
}

output "origin_domain_name" {
  value       = aws_s3_bucket.this.bucket_domain_name
  description = "string ||| The domain name for the created S3 bucket that can be used as an origin for CloudFront."
}

output "origin_id" {
  value       = "S3-${aws_s3_bucket.this.id}"
  description = "string ||| The ID of the created S3 bucket used as an origin."
}

output "origin_access_identity" {
  value       = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
  description = "string ||| A prebuilt CloudFront origin access identity that is configured to work with the created S3 bucket."
}

output "deployer" {
  value = {
    name       = aws_iam_user.deployer.name
    access_key = aws_iam_access_key.deployer.id
    secret_key = aws_iam_access_key.deployer.secret
  }

  description = "object({ name: string, access_key: string, secret_key: string }) ||| An AWS User with explicit privilege to deploy to the S3 bucket."

  sensitive = true
}
