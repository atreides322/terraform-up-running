provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-06382629a9eb569e3"
  instance_type = "t2.micro"
}
