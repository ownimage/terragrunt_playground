terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

variable "docker_name" {
  type        = string
  description = "docker name of the nginx instance"
  default     = "default_name"
}

variable "docker_port" {
  type        = number
  description = "docker external_port of the nginx instance"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = var.docker_name
  ports {
    internal = 80
    external = var.docker_port
  }
}
