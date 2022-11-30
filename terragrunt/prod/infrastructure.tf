module "combined" {
  source = "github.com/ownimage/terragrunt_playground//terragrunt/modules/combined?ref=v1.1"
  env = var.env
}

output "my_output" {
  value = var.env
}

