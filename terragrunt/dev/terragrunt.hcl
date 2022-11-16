terraform {
  source = "../modules"
}

inputs = {
  env_name = "dev"
  docker_port = 8081
}