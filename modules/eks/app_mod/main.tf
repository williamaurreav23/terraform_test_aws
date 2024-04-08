resource "kubernetes_deployment" "my_app_deployment" {
  metadata {
    name = "my-app"
  }

  spec {
    template {
      metadata {
        labels = {
          app = "my-app"
        }
      }

      spec {
        # Aquí va la configuración del contenedor de tu aplicación
        container {
          name  = "my-container"
          image = "nginx:latest"  # Cambia la imagen por la de tu aplicación

          # Puedes agregar más configuraciones del contenedor aquí si es necesario
          # Por ejemplo, puertos, variables de entorno, volúmenes, etc.
          ports {
            container_port = 80  # Puerto en el que tu aplicación está escuchando
          }

          # Ejemplo de definición de variables de entorno
          env {
            name  = "ENV_VARIABLE"
            value = "valor_de_la_variable"
          }
        }
      }
    }
  }
}