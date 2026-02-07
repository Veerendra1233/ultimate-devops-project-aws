provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../../modules/vpc"

  environment = var.environment
  cidr_block  = var.vpc_cidr
}

module "eks" {
  source = "../../modules/eks"

  environment      = var.environment
  cluster_name     = var.cluster_name
  cluster_version  = var.cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids

  node_instance_type = var.node_instance_type
  desired_nodes      = var.desired_nodes
}
