resource "kubernetes_service" "nginx" {

  metadata {
    name      = "nginx-service"
    namespace = kubernetes_namespace.infra.metadata[0].name
  }

  spec {

    selector = {
      app = "nginx"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}