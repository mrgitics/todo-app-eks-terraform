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

variable "publicly_accessible" {
  description = "Should the RDS instance be publicly accessible?"
  type        = bool
  default     = false
}
variable "eks_security_group_id" {
  description = "Security group ID for the EKS cluster to allow database access"
  type        = string
}
variable "eks_subnet_cidrs" {
  description = "List of EKS subnet CIDRs"
  type        = list(string)
}
variable "vpc_id" {
  description = "The VPC ID for the RDS instance"
  type        = string
}
variable "vpc_cidr_block" {
  description = "CIDR block of the VPC where RDS resides"
  type        = string
}
variable "eks_node_sg_id" {
  description = "Security group ID for EKS nodes"
  type        = string
}
variable "private_subnet_ids" {
  description = "List of private subnet IDs where the RDS instance will reside"
  type        = list(string)
}
