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

resource "docker_container" "mysql_container" {
        name  = "${var.container_name}"
        # image = "${var.image_name}"
        image = docker_image.mysql_image.name
        
        env= ["MYSQL_ROOT_PASSWORD = ${var.mysql_root_password}"] 
        volumes {
            volume_name = docker_volume.mysql_data_volume.name
            container_path = "/var/lib/mysql"
        }
        hostname = docker_network.private_bridge_network.name
        network_mode = docker_network.private_bridge_network.driver 
        command = [
            "tail",
            "-f",
            "/dev/null"
        ]      
    }