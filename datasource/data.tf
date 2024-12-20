provider "aws" {
  region = "us-east-1"

}


data "aws_ami" "example" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20241109"]
    #values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


data "aws_vpc" "default" {
  default = true

}



