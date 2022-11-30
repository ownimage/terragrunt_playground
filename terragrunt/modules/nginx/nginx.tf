terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.21.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = var.docker_image_name
  #  name = "nginx:1.23.2"
  # if keep_locally is set to false it will remove the image from the docker cache when you do a
  # terragrunt destroy
  # this will fail as there is a shared cache for prod and dev as they both on the local machine
  # it will complain that the image is in use.
  keep_locally = true
}



resource "docker_container" "nginx" {
  image = docker_image.nginx.name
  name  = "${var.env_name}_nginx"
  ports {
    internal = 80
    external = var.nginx_port
  }
}
