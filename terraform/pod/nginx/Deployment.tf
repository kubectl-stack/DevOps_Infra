resource "kubernetes_deployment" "nginx" {

  metadata {
    name      = "nginx-deployment"
    namespace = kubernetes_namespace.infra.metadata[0].name

    labels = {
      app = "nginx"
    }
  }

  spec {

    replicas = 2

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {

      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {

        container {

          name  = "nginx"
          image = "nginx:latest"

          port {
            container_port = 80
          }

          resources {
            requests = {
              cpu    = "250m"
              memory = "256Mi"
            }

            limits = {
              cpu    = "500m"
              memory = "512Mi"
            }
          }
        }
      }
    }
  }
}