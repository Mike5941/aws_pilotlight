terraform {
  backend "s3" {
    bucket = "terraform-wonsoong"
    key    = "stage/network/primary/terraform.tfstate"
    region = "ap-northeast-2"

    dynamodb_table = "terraform-wonsoong"
    encrypt        = true
  }
}

module "primary" {
  source = "../../../../modules/network"

  project_name = "primary"
  vpc_cidr     = "10.1.0.0/16"
}



