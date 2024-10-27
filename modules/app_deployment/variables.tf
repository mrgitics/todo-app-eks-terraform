# Backend variables
variable "backend_app_name" {
  description = "Name of the backend application"
  type        = string
}

variable "backend_image" {
  description = "Docker image of the backend application"
  type        = string
}

variable "backend_replicas" {
  description = "Number of replicas for the backend application"
  type        = number
  default     = 2
}

variable "backend_container_port" {
  description = "Container port for the backend application"
  type        = number
}

variable "backend_service_port" {
  description = "Service port for the backend application"
  type        = number
}

# Frontend variables
variable "frontend_app_name" {
  description = "Name of the frontend application"
  type        = string
}

variable "frontend_image" {
  description = "Docker image of the frontend application"
  type        = string
}

variable "frontend_replicas" {
  description = "Number of replicas for the frontend application"
  type        = number
  default     = 2
}

variable "frontend_container_port" {
  description = "Container port for the frontend application"
  type        = number
}

variable "frontend_service_port" {
  description = "Service port for the frontend application"
  type        = number
}
# Database variables for backend
variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_host" {
  description = "Database host (endpoint)"
  type        = string
}
