
module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
}

module "networking" {
  source = "./modules/networking"

  project_name      = var.project_name
  cluster_name      = var.cluster_name
  environment       = var.environment
  cluster_tag_value = var.cluster_tag_value

  vpc_cidr              = var.vpc_cidr
  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_cidr  = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr

  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2
}

module "security" {
  source = "./modules/security"

  project_name = var.project_name
  environment  = var.environment
  cluster_name = var.cluster_name

  vpc_id = module.networking.vpc_id
}
