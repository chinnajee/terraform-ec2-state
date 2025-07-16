variable "ami" {
  type        = string
  description = "AMI ID to use for EC2 instance"
}

variable "key_pair_name" {
  type        = string
  description = "Name of the EC2 key pair"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "number_of_instances" {
  type        = number
  description = "The number of EC2 instances to create"
}

variable "aws_iam_instance_profile" {
  type        = string
  description = "IAM instance profile name"
}
