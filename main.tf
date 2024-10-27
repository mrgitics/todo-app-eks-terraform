provider "aws" {
  region = var.aws_region
}

provider "kubernetes" {
  host                   = module.eks_cluster.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks_cluster.certificate_authority_data)
  token                  = module.eks_cluster.auth_token

}

module "vpc" {
  source               = "./modules/vpc"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "security_group" {
  source           = "./modules/security_group"
  vpc_id           = module.vpc.vpc_id
  vpc_cidr_block   = module.vpc.cidr_block
  eks_subnet_cidrs = module.vpc.private_subnet_cidrs
}

module "iam_roles" {
  source = "./modules/iam_roles"
}

module "eks_cluster" {
  source              = "./modules/eks_cluster"
  cluster_name        = var.cluster_name
  cluster_role_arn    = module.iam_roles.eks_cluster_role_arn
  subnet_ids          = module.vpc.subnet_ids
  public_subnet_ids   = module.vpc.public_subnet_ids
  private_subnet_ids  = module.vpc.private_subnet_ids
  security_group_id   = module.security_group.eks_node_sg_id
  node_group_role_arn = module.iam_roles.eks_node_group_role_arn
  node_desired_size   = var.node_desired_size
  vpc_id              = module.vpc.vpc_id
  node_min_size       = var.node_min_size
  node_max_size       = var.node_max_size
  instance_type       = var.instance_type
}

module "rds" {
  source                = "./modules/rds"
  allocated_storage     = var.allocated_storage
  instance_class        = var.instance_class
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  eks_node_sg_id        = module.security_group.eks_node_sg_id
  eks_security_group_id = module.eks_cluster.security_group_id
  publicly_accessible   = false
  eks_subnet_cidrs      = module.vpc.private_subnet_cidrs

  private_subnet_ids = module.vpc.private_subnet_ids
  vpc_id             = module.vpc.vpc_id
  vpc_cidr_block     = module.vpc.cidr_block
}

module "app_deployment" {
  source = "./modules/app_deployment"


  backend_app_name       = "backend-app"
  backend_image          = var.backend_image
  backend_replicas       = var.backend_replicas
  backend_container_port = 5001
  backend_service_port   = 5001
  db_user                = var.db_username
  db_password            = var.db_password
  db_name                = var.db_name
  db_host                = module.rds.db_endpoint


  frontend_app_name       = "frontend-app"
  frontend_image          = var.frontend_image
  frontend_replicas       = var.frontend_replicas
  frontend_container_port = 80
  frontend_service_port   = 3000
}
