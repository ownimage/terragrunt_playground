terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.21.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "main" {
  name = "sha256:404359394820dad4c8f210f935939f5890a02ccf82302e1a1068bd0723149736"
  #  name = "nginx:1.22.1"
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

variable "main_port" {
  type        = number
  description = "docker external_port of the main instance"
}

resource "docker_container" "nginx" {
  image = docker_image.main.name
  name  = "${var.env_name}_main"
  ports {
    internal = 80
    external = var.main_port
  }
}
