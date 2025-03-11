module "vpc" {
  source         = "./modules/vpc"
  env            = var.env
  zone1          = var.zone1
  zone2          = var.zone2
  eks_name       = var.eks_name
  terraform_tags = var.terraform_tags
}
