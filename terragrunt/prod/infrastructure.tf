module "combined" {
  source = "../modules/combined"
  env = var.env
}

output "my_output" {
  value = var.env
}

