# to use s3 backend 
# s3 bucket is configured at command line
terraform {
  backend "s3" {}
}

# setup terraform aws provider to create resources in your desired aws region
provider "aws" {
  region = var.region

  # uncomment and substitute the arn if you are using assume role to talk to your aws account
  # read the official terraform aws provider and aws documentation on how to achieve this
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration
  # assume_role {
  #   role_arn = "<aws iam role arn>"
  # }

}

# invoke cluster module which creates vpc, subnets and eks cluter
module "cluster" {
  source = "../modules/cluster"

  # vpc details
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr

  # eks details
  eks_cluster_name = var.cluster_name
  k8s_version      = var.k8s_version
}