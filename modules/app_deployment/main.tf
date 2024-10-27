resource "kubernetes_deployment" "backend_app" {
  metadata {
    name = var.backend_app_name
  }
  spec {
    replicas = var.backend_replicas
    selector {
      match_labels = {
        app = var.backend_app_name
      }
    }
    template {
      metadata {
        labels = {
          app = var.backend_app_name
        }
      }
      spec {
        container {
          image = var.backend_image
          name  = var.backend_app_name
          port {   # Change `ports` to `port`
            container_port = var.backend_container_port
          }
          # Environment variables for backend database
          env {
            name  = "DB_HOST"
            value = var.db_host
          }
          env {
            name  = "DB_USER"
            value = var.db_user
          }
          env {
            name  = "DB_PASS"
            value = var.db_password
          }
          env {
            name  = "DB_NAME"
            value = var.db_name
          }
          env {
            name  = "DB_PORT"
            value = "5432"
          }
          env {
            name  = "USE_SSL"
            value = "true"
          }
          env {
            name  = "PGSSLMODE"
            value = "require"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "backend_service" {
  metadata {
    name = "server"
  }
  spec {
    type = "ClusterIP"
    port {  # Change `ports` to `port`
      port        = var.backend_service_port
      target_port = var.backend_container_port
    }
    selector = {
      app = var.backend_app_name
    }
  }
}

resource "kubernetes_deployment" "frontend_app" {
  metadata {
    name = var.frontend_app_name
  }
  spec {
    replicas = var.frontend_replicas
    selector {
      match_labels = {
        app = var.frontend_app_name
      }
    }
    template {
      metadata {
        labels = {
          app = var.frontend_app_name
        }
      }
      spec {
        container {
          image = var.frontend_image
          name  = var.frontend_app_name
          port {  # Change `ports` to `port`
            container_port = var.frontend_container_port
          }
          # Environment variables for backend connection
          env {
            name  = "REACT_APP_BACKEND_HOST"
            value = "server"
          }
          env {
            name  = "REACT_APP_BACKEND_PORT"
            value = tostring(var.backend_service_port)
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "frontend_service" {
  metadata {
    name = "${var.frontend_app_name}-service"
  }
  spec {
    type = "LoadBalancer"
    port {  # Change `ports` to `port`
      port        = var.frontend_service_port
      target_port = var.frontend_container_port
    }
    selector = {
      app = var.frontend_app_name
    }
  }
}
