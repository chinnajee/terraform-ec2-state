provider "aws" {
  region = "us-east-1"
}

module "iam" {
  source = "../../modules/iam"
}

module "ec2_instance" {
  source = "../../modules/ec2_instance"

  ami                      = var.ami
  key_pair_name            = var.key_pair_name
  security_group_ids       = var.security_group_ids
# number_of_instances      = var.number_of_instances
  count                    = var.number_of_instances
  aws_iam_instance_profile = module.iam.instance_profile_name
}
