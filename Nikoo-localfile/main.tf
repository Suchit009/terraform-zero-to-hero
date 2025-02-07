terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.2"
    }
  }
}

provider "local" {
  # Configuration options
}

variable "var_content" {
  type = map(string)
  default = {
    "dev"  = "this is dev"
    "qa"  = "this is qa"
    "prod" = "this is prod"
  }
}

variable "var_filename" {
  type = map(string)
  default = {
    "dev"  = "D:/Suchit/terraform/dev.txt"
    "qa"  = "D:/Suchit/terraform/qa.txt"
    "prod" = "D:/Suchit/terraform/prod.txt"
  }
}


module "local_file" {
  source = "./modules/local_file"
  var_content = lookup(var.var_content, terraform.workspace, "this is not a expected env")
  var_filename = lookup(var.var_filename, terraform.workspace, "D:/Suchit/terraform/default.txt")
}