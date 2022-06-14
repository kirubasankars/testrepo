variable "project" {
  type = object({
    cluster_id          = string
    va_application_id   = string
  })
}

variable "environment" {
  type        = string
  description = "This holds environment name. Example: test, accept, uat, prod"
}

variable "aws_region" {
  type        = string
  description = "This is the region we use in AWS"
  default     = "us-east-1"
}

variable "network" {
  type = object({
    hov_security_group_id     = string
    subnet_group              = string
  })
}

provider "aws" {
  region  = var.aws_region
}

resource "aws_elasticache_replication_group" "replication_group" {
  replication_group_id          = "redis5-${var.project.cluster_id}-${var.environment}"
  description                   = "redis5-${var.project.cluster_id}-${var.environment}"
  subnet_group_name             = var.network.subnet_group
  automatic_failover_enabled    = var.environment == "uat" || var.environment == "prod" ? true : false
  node_type                     = "cache.t3.micro"
  engine                        = "redis"
  engine_version                = "5.0.5"
  auth_token                    = "dasdasdasdasdasd"
  at_rest_encryption_enabled    = true
  transit_encryption_enabled    = true
  apply_immediately             = true
  multi_az_enabled              = var.environment == "uat" || var.environment == "prod" ? true : false
  num_cache_clusters            = var.environment == "uat" || var.environment == "prod" ? 3 : 1
  port                          = 6379
  security_group_ids            = [var.network.hov_security_group_id]
}

resource "aws_elasticache_cluster" "elasticcache" {
  cluster_id           =  "redis5-${var.project.cluster_id}-${var.environment}"
  replication_group_id =  aws_elasticache_replication_group.replication_group.id
  tags = {
    "VA-ApplicationId" = var.project.va_application_id
  }
}

output "primary_endpoint" {
  value = aws_elasticache_replication_group.replication_group.primary_endpoint_address
}