# terraform {
#                   required_providers {
#                   docker = {
#                   source  = "kreuzwerker/docker"
#                   version = "2.12.0"
#                           }
#                       }
#                   }

#                   provider "docker" {
#                   host = "npipe:////.//pipe//docker_engine"
#                       }

      resource "docker_image" "mysql_image" {
        name = "${var.image_name}"
      }