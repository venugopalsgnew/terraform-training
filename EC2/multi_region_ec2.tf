
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us_west_2"
  region = "us-west-2"
}

resource "aws_instance" "us_east_1_instance" {
  provider          = aws.us_east_1
  ami               = "ami-0c55b159cbfafe1f0" # Example AMI ID for us-east-1
  instance_type     = "t2.micro"

  tags = {
    Name = "US-East-1-Instance"
  }
}

resource "aws_instance" "us_west_2_instance" {
  provider          = aws.us_west_2
  ami               = "ami-0abcdef1234567890" # Example AMI ID for us-west-2
  instance_type     = "t2.micro"

  tags = {
    Name = "US-West-2-Instance"
  }
}
