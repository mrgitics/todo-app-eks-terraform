variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "The name of the EKS Cluster"
  type        = string
  default     = "todo-eks-cluster"
}

variable "instance_type" {
  description = "The EC2 instance type for the EKS node group"
  type        = string
  default     = "t3.medium"
}

variable "frontend_image" {
  description = "Docker image for the frontend application"
  type        = string
}

variable "backend_image" {
  description = "Docker image for the backend application"
  type        = string
}

variable "frontend_replicas" {
  description = "Number of replicas for the frontend deployment"
  type        = number
  default     = 2
}

variable "backend_replicas" {
  description = "Number of replicas for the backend deployment"
  type        = number
  default     = 2
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes for the database"
  type        = number
  default     = 20
}

variable "instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the RDS database"
  type        = string
}

variable "db_username" {
  description = "The username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "The password for the RDS database"
  type        = string
}

variable "node_desired_size" {
  description = "Desired number of nodes in EKS Node Group"
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum number of nodes in EKS Node Group"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of nodes in EKS Node Group"
  type        = number
  default     = 3
}
