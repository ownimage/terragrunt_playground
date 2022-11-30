variable "env_name" {
  type        = string
  description = "environment"
  default     = "missing"
}

variable "docker_image_name" {
  type        = string
  description = "docker image name"
}

variable "nginx_port" {
  type        = number
  description = "docker external_port of the nginx instance"
}