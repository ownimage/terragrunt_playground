inputs = {
  env_name = "dev"
  main_port = 8081
  nginx_port = 8082
}
remote_state {
  backend = "local"
  config = {
    path= "../state/${path_relative_to_include()}/terraform.tfstate"
  }
}

