module "combined" {
  source = "github.com/ownimage/terragrunt_playground//terragrunt/modules/combined?ref=v1.1"
  env = local.env
}
