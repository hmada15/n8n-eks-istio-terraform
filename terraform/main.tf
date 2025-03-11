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

module "helm" {
  source = "./modules/helm"

  env                 = var.env
  terraform_tags      = var.terraform_tags
  eks_cluster_name    = module.eks.eks_cluster_name
  vpc_id              = module.vpc.vpc_id
  eks_cluster_node_id = module.eks.eks_cluster_node_id
  region              = var.region
  grafana_password    = var.grafana_password
}

module "db" {
  source = "./modules/db"

  db_allocated_storage       = var.db_allocated_storage
  db_storage_type            = var.db_storage_type
  db_engine_version          = var.db_engine_version
  db_instance_class          = var.db_instance_class
  db_name                    = var.db_name
  db_username                = var.db_username
  db_password                = var.db_password
  db_parameter_group_name    = var.db_parameter_group_name
  db_backup_retention_period = var.db_backup_retention_period
  db_identifier              = var.db_identifier
  db_security_group_ids      = var.db_security_group_ids
  db_subnet_group_name       = var.db_subnet_group_name
}
