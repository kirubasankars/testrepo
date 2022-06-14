
module "prod-us-east-1" {
  source = "../../modules/elasticcache"
  environment = "prod"
  aws_region  = "us-east-1"

  network = {
    "hov_security_group_id"     : "",
    "subnet_group"              : ""
  }

  project = {
    "cluster_id"        : "",
    "va_application_id" : ""
  }
}


module "prod-us-west-2" {
  source = "../../modules/elasticsearch"
  environment = "prod"
  aws_region  = "us-west-2"

  network = {
    "hov_security_group_id"     : "",
    "subnet_group"              : ""
  }

  project = {
    "cluster_id"        : "acxiom-4",
    "va_application_id" : ""
  }
}

