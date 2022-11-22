variable "cidrblock" {}
variable "marca" {}
variable "environment" {}

variable "azones" {
  default = ["us-east-1c", "us-east-1d"]
}

locals {
  publicblock01 = cidrsubnet(var.cidrblock, 8, 5)
  publicblock02 = cidrsubnet(var.cidrblock, 8, 10)
}

subnets = [locals]
