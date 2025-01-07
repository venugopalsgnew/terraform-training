# Define provider for Account 1
provider "aws" {
  alias   = "account1"
  region  = "us-east-1"
  profile = "account1_profile" # Specify the AWS CLI profile for Account 1
}

# Define provider for Account 2
provider "aws" {
  alias   = "account2"
  region  = "us-east-1"
  profile = "account2_profile" # Specify the AWS CLI profile for Account 2
}

# Define an EC2 instance for Account 1
resource "aws_instance" "ec2_account1" {
  provider          = aws.account1
  ami               = "ami-0c02fb55956c7d316" # Replace with a valid AMI ID
  instance_type     = "t2.micro"
  tags = {
    Name = "EC2-Account1"
  }
}

# Define an EC2 instance for Account 2
resource "aws_instance" "ec2_account2" {
  provider          = aws.account2
  ami               = "ami-0c02fb55956c7d316" # Replace with a valid AMI ID
  instance_type     = "t2.micro"
  tags = {
    Name = "EC2-Account2"
  }
}
