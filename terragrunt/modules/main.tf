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
  name = "nginx:1.23.2"
  # if keep_locally is set to false it will remove the image from the docker cache when you do a
  # terragrunt destroy
  # this will fail as there is a shared cache for prod and dev as they both on the local machine
  # it will complain that the image is in use.
  keep_locally = true
}

variable "env_name" {
  type        = string
  description = "environment"
  default     = "missing"
}

variable "docker_port" {
  type        = number
  description = "docker external_port of the nginx instance"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.name
  name  = "${var.env_name}_nginx"
  ports {
    internal = 80
    external = var.docker_port
  }
}
