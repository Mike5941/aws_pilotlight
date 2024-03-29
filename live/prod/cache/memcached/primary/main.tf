terraform {
  backend "s3" {
    bucket = "terraform-wonsoong"
    key    = "stage/cache/memcached/terraform.tfstate"
    region = "ap-northeast-2"

    dynamodb_table = "terraform-wonsoong"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-northeast-2"
  alias  = "primary"
}


module "primary_cache" {
  source = "../../../../../modules/cache/memcached"

  providers = {
  }

  cluster_id = "primary-memcached"

  web_remote_state_key = "stage/services/web/primary/terraform.tfstate"
  vpc_remote_state_key = "stage/network/primary/terraform.tfstate"
}


