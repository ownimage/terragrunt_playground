terraform {
  source = "../modules"
}

inputs = {
  docker_name = "prod_nginx"
  docker_port = 8082
}