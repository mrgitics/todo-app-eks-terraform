# AWS region to deploy resources in
aws_region = "eu-west-2"

# EKS Cluster name
cluster_name = "todo-eks-cluster"

# Instance type for EKS nodes
instance_type = "t3.medium"

# Docker image for the frontend
frontend_image = "mrgitics/todo-frontend"

# Docker image for the backend
backend_image = "mrgitics/todo-app-backend"

# Number of replicas for frontend and backend deployments
frontend_replicas = 2
backend_replicas  = 2

db_name     = "postgres"
db_username = "postgres"
db_password = "postgres"

node_desired_size = 2
node_min_size     = 1
node_max_size     = 3
