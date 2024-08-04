output "cd_user_access_key_id" {
  description = "aws key id for cd user"
  value       = aws_iam_access_key.cd.id

}

output "cd_user_access_key_secret" {
  description = "Access key secret for cd user"
  value       = aws_iam_access_key.cd.secret
  sensitive   = true

}
