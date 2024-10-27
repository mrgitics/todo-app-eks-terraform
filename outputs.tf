
output "frontend_service_external_ip" {
  value = module.app_deployment.frontend_service_external_ip
  description = "The external IP of the frontend LoadBalancer service"
}
