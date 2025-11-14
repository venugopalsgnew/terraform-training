provider "aws" {
  alias  = "north-virgenia"
  region = "us-east-1"
}

provider "aws" {
  region = "ap-south-1"
}



resource "aws_vpc" "main" {
  provider = aws.north-virgenia
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "devops-vpc"
  }
}
