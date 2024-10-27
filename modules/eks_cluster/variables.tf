variable "cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
}

variable "cluster_role_arn" {
  description = "IAM role ARN for EKS Cluster"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for EKS Cluster"
  type        = list(string)
}
variable "public_subnet_ids" {
  description = "Public subnet IDs for EKS Load Balancer or frontend services"
  type        = list(string)
}
variable "private_subnet_ids" {
  description = "Public subnet IDs for EKS Load Balancer or frontend services"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security Group ID for EKS Cluster"
  type        = string
}

variable "node_group_role_arn" {
  description = "IAM role ARN for EKS Node Group"
  type        = string
}

variable "node_desired_size" {
  description = "Desired number of nodes"
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum number of nodes"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of nodes"
  type        = number
  default     = 3
}


variable "instance_type" {
  description = "EC2 instance type for EKS Node Group"
  type        = string
  default     = "t3.medium"
}

variable "vpc_id" {
  description = "The VPC ID in which the EKS cluster is deployed"
  type        = string
}

