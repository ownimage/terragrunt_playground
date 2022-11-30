variable "env" {
  type        = map
  description = "environment"
  default     =   {
    env_name = "dev",
    nginx_port = 9091,
    main_port = 9092,
    server_port = 9093
  }
}
