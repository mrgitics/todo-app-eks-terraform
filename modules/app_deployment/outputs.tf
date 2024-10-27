output "backend_service_name" {
  value = kubernetes_service.backend_service.metadata[0].name
  description = "The name of the backend service"
}
output "backend_service_cluster_ip" {
  value       = kubernetes_service.backend_service.spec[0].cluster_ip
  description = "The Cluster IP of the backend service (accessible within the cluster)"
}
output "frontend_service_external_ip" {
  value       = kubernetes_service.frontend_service.status[0].load_balancer[0].ingress[0].hostname
  description = "The external IP of the frontend LoadBalancer service"
}
