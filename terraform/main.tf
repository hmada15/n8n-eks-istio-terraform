module "vpc" {
  source         = "./modules/vpc"
  env            = var.env
  zone1          = var.zone1
  zone2          = var.zone2
  eks_name       = var.eks_name
  terraform_tags = var.terraform_tags
}

module "eks" {
  source          = "./modules/eks"
  env             = var.env
  subnet_zone1_id = module.vpc.subnet_zone1_id
  subnet_zone2_id = module.vpc.subnet_zone2_id
  eks_name        = var.eks_name
  terraform_tags  = var.terraform_tags
}

module "k8s" {
  source = "./modules/k8s"
  providers = {
    kubectl = kubectl
  }
  env                 = var.env
  terraform_tags      = var.terraform_tags
  eks_cluster_name    = module.eks.eks_cluster_name
  vpc_id              = module.vpc.vpc_id
  eks_cluster_node_id = module.eks.eks_cluster_node_id
  region              = var.region
}
