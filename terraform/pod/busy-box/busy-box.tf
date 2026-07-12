resource "kubernetes_pod" "busybox" {

  metadata {
    name      = "busybox-pod"
    namespace = kubernetes_namespace.infra.metadata[0].name

    labels = {
      app = "busybox"
    }
  }

  spec {
    container {
      name  = "busybox"
      image = "busybox:latest"

      command = [
        "sh",
        "-c",
        "while true; do echo 'BusyBox is running'; sleep 30; done"
      ]
    }
  }
}