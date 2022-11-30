variable "env" {
  type        = map
  description = "environment"
#  default     = { env_name = "missing", nginx_port = 8080 }
}


module "nginx" {
  source      = "../nginx"
  env_name    = var.env["env_name"]
  nginx_port  = var.env["nginx_port"]
}

module "main" {
  source    = "../main"
  env_name  = var.env["env_name"]
  main_port = var.env["main_port"]
}

module "server" {
  source    = "../server"
  env_name  = var.env["env_name"]
  server_port = var.env["server_port"]
}
