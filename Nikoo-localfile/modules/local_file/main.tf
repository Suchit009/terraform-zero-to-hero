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
  default = "this is dev env"
}

variable "var_filename" {
  default = "this is dev env"
}

resource "local_file" "my_file" {
  content  = var.var_content
  filename = var.var_filename
}