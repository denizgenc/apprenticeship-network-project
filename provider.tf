provider "aws" {
  version = "~> 2.30"
  region  = var.aws_region
}

provider "random" {
  version = "~> 2.2"
}

