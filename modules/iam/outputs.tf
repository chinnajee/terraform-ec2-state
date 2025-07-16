output "instance_profile_name" {
  description = "The name of the IAM instance profile for EC2"
  value       = aws_iam_instance_profile.ssm_instance_profile.name
}
