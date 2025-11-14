provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "datacenter" {
  cidr_block                       = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = "datacenter-vpc"
  }
}

output "ipv6_cidr_block" {
  value = aws_vpc.datacenter.ipv6_cidr_block
}
