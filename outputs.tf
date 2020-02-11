output "admin_role_arn" {
  value = module.iam_assumable_role_admin.this_iam_role_arn
}

output "cloudtrail_bucket_arn" {
  value = aws_s3_bucket.cloudtrail.arn
}

output "cloudtrail_bucket_id" {
  value = aws_s3_bucket.cloudtrail.id
}

output "cloudtrail_id" {
  value = aws_cloudtrail.main.id
}

output "cloudtrail_arn" {
  value = aws_cloudtrail.main.arn
}
