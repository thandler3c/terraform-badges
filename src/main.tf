locals {
  tags = { "Purpose" = "TF Training" }
}

# Configure Resource Gruop
module "rg" {
  source = "./modules/resource-group"

  resource_group = {
    create      = true
    name        = "rg-${var.environment}-thandler-tf-001"
    location    = var.location
    tags        = local.tags
  }
}

