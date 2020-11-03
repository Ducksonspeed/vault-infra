# The MIT License (MIT)
# Copyright (c) 2014-2020 Avant, Sean Lingren

############################
## Environment #############
############################
aws_secret = "~/.aws/credentials"
profile = "Terraform"
name_prefix    = "vault-prod"
region         = "eu-west-2"
dr_region      = "eu-west-2"

# Tags and tags_asg must be duplicated to handle the
# map expected for most terraform tag blocks and list
# of maps expected when tagging instances in an ASG
tags = {
  env        = "prod"
  department = "systems"
  syscontact = "alex"
}

############################
## Route53 #################
############################
# Route53 support is under a switch `route53_enabled`
route53_enabled     = true
zone_id             = "Z09454851FY5N1CY4GH9W" # Route53 zone id

############################
## Networking ##############
############################
vault_dns_address = "https://vault.alexhayward.me:443"

vpc_id = "vpc-001f3512dd41d0900"

ec2_subnets = ["subnet-0a9c78b5aff50abc4", "subnet-015b7e85e560c7abc", "subnet-0f2894d09c887d17d"]
alb_subnets = ["subnet-0527ec1b47aa6172d", "subnet-09f3b9466b710e764", "subnet-0a2b8e2a8c7f0baf5"]

alb_allowed_ingress_cidrs = ["0.0.0.0/0"]

############################
## ALB #####################
############################
alb_certificate_arn = "arn:aws:acm:eu-west-2:926265453946:certificate/45b375f2-767c-4add-9a7e-fced86d40152"

############################
## EC2 #####################
############################
ami_id        = "ami-00f504ed80d5a25e2"
instance_type = "t3a.nano"
ssh_key_name  = "hasicorp-vault-ssh-key"

asg_min_size         = 2
asg_max_size         = 3
asg_desired_capacity = 2

############################
## S3 ######################
############################
vault_resources_bucket_name = "alex-infra-vault-resources"
vault_data_bucket_name      = "alex-infra-vault-data"

############################
## DynamoDB ################
############################
dynamodb_table_name = "vault-ha-coordination"
