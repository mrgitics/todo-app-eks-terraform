output "cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value       = aws_eks_cluster.this.endpoint
}
output "cluster_name" {
  description = "The name of the EKS Cluster"
  value       = aws_eks_cluster.this.name
}
output "certificate_authority_data" {
  description = "The base64 encoded certificate data required for authentication"
  value       = aws_eks_cluster.this.certificate_authority.0.data
}
output "auth_token" {
  description = "Authentication token for Kubernetes provider"
  value       = data.aws_eks_cluster_auth.cluster.token
}
output "security_group_id" {
  description = "Security group ID for the EKS cluster"
  value       = aws_security_group.eks_cluster_sg.id  # Make sure this is the correct SG reference in the EKS module
}
