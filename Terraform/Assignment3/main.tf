terraform {
              required_providers {
                docker = {
                  source  = "kreuzwerker/docker"
                  version = "2.12.0"
                }
              }
          }

              provider "docker" {
              host = "npipe:////.//pipe//docker_engine"
          }
# Download the latest Ghost Image
resource "docker_image" "image_id" {
  name = "${lookup(var.image_name, var.env)}"
}

# Start the Container
resource "docker_container" "container_id" {
  name  = "${lookup(var.container_name, var.env)}"
  image = "${lookup(var.image_name, var.env)}"
  ports {
    internal = "2368"
    external = "${lookup(var.ext_port, var.env)}"
  }
}
