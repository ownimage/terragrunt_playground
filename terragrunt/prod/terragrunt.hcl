terraform {
  source = "../modules"
}

inputs = {
  env_name = "prod"
  docker_port = 8082
}