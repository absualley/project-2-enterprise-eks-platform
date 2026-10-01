module "iam" {

  source = "./modules/iam"

  project_name = var.project_name

}

cluster_role_arn = module.iam.cluster_role_arn

node_role_arn = module.iam.node_role_arn
