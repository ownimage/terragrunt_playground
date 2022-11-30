variable "env" {
  type        = map
  description = "environment"
  default     =   {
    env_name = "prod",
    nginx_port = 8081,
    main_port = 8082,
    server_port = 8083
  }
}
