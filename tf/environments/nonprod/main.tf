
module "prod-us-east-1" {
  source = "../../modules/elasticcache"
  environment = "prod"
  aws_region  = "us-east-1"

  network = {
    "hov_security_group_id"     : "sg-00dd670623136171b",
    "subnet_group"              : "acxio-cache-1g69297q30w77"
  }

  project = {
    "cluster_id"        : "acxiom-4",
    "va_application_id" : "redis5-acxiom-accept"
  }
}


module "prod-us-west-2" {
  source = "../../modules/elasticsearch"
  environment = "prod"
  aws_region  = "us-west-2"

  network = {
    "hov_security_group_id"     : "sg-00dd670623136171b",
    "subnet_group"              : "acxio-cache-1g69297q30w77"
  }

  project = {
    "cluster_id"        : "acxiom-4",
    "va_application_id" : ""
  }
}

