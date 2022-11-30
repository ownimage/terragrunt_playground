module "combined" {
#  source = "github.com/ownimage/terragrunt_playground//terragrunt/modules/combined?ref=v1.1"
  source = "../modules/combined"
  env = local.env
}

