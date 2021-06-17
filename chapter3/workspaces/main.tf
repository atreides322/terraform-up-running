terraform {
  backend "s3" {
    bucket         = "atreides322-terraform-up-running-state"
    key            = "workspaces-example/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "atreides322-terraform-up-running-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami             = "ami-06382629a9eb569e3"
  instance_type   = "t2.micro"
}
