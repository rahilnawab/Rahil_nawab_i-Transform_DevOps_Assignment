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

        # Pulls the image
        resource "docker_image" "ghost_image" {
        name = var.image_name
        }

        resource "docker_container" "ghost_container" {
        name  = var.container_name
        image = var.image_name
        ports {
        internal = "2368"
        external = var.ext_port
        }
        }

    

variable "image_name" {
    #type= string
    default = "ghost:latest"
}
variable "container_name" {
    #type= string
    default = "ghost_blog"
}
variable "ext_port" {
    type= number
    default = "80"
}