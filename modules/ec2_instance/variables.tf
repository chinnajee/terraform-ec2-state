variable "instance_type" {
  type        = string
  description = "The type of AWS EC2 instance to launch."
  default     = "t2.micro"
}

variable "number_of_instances" {
  type        = number
  description = "The number of EC2 instances to create."
  default     = 1
}

variable "ami" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "ebs_optimized" {
  type        = bool
  description = "Whether the EC2 instance is EBS-optimized."
  default     = true
}

variable "instance_tenancy" {
  type        = list(string)
  description = "The tenancy of the instance. Valid values are 'default' or 'dedicated'."
  default     = ["default"]
}

variable "security_group_ids" {
  type        = list(string)
  description = "A list of security group IDs to associate with the instance."
  default     = ["sg-0bbbc49cb505940f8"]
}

variable "metadata_options" {
  type = object({
    http_endpoint            = string
    http_tokens              = string
    http_put_response_hop_limit = number
  })
  description = "Metadata options for the instance."
  default     = {
    http_endpoint            = "enabled"
    http_tokens              = "required"
    http_put_response_hop_limit = 1
  }
}

variable "root_block_device" {
  type = object({
    volume_type           = string
    volume_size           = number
    delete_on_termination = bool
  })
  description = "Configuration details for the root block device."
  default     = {
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = true
  }
}

variable "launchDate" {
  type        = tuple([number, string])
  description = "A tuple representing the launch date (day and month)."
  default     = [15, "July"]
}

variable "aws_iam_instance_profile" {
  type        = string
  description = "The name of an existing IAM instance profile with SSM permissions."
  default     = "SSMEC2InstanceProfile"
}

variable "key_pair_name" {
  type        = string
  description = "Name of the existing EC2 Key Pair to use for SSH access."
  default     = "demo1" # 🔑 Update this if the name is different
}
