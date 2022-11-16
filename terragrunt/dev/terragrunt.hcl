terraform {
  source = "../modules"
}

inputs = {
  docker_name = "dev_nginx"
  docker_port = 8081
}