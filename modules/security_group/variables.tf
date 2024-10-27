variable "vpc_id" {
  description = "VPC ID for the security groups"
  type        = string
}
variable "vpc_cidr_block" {
  description = "CIDR block of the VPC where RDS resides"
  type        = string
}
variable "eks_subnet_cidrs" {
  description = "List of CIDR blocks for EKS private subnets"
  type        = list(string)
}
