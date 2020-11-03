# The MIT License (MIT)
# Copyright (c) 2014-2020 Avant, Sean Lingren

provider "aws" {
  region = var.region
  profile = var.profile
  shared_credentials_file = file(var.aws_secret)
}
