
# Define the AWS provider
provider "aws" {
  region = var.region # Default region for the provider
}

# Define a map variable containing AMI IDs for different regions

variable "ami_map" {
  type = map(string)
  default = {
    us-east-1      = "ami-07d9b9ddc6cd8dd30"
    us-west-2      = "ami-08f7912c15ca96832"
    ap-southeast-1 = "ami-0123c9b6bfb7eb962"
  }
}

variable "region" {
  default = "ap-southeast-1"
}

# Create an AWS instance using the AMI ID from the map variable
resource "aws_instance" "example" {
  #ami           = var.ami_map[var.region] # Pick AMI based on the region  -- this too would work
  ami          = lookup(var.ami_map, var.region) # Can also call this approach too
  instance_type = "t2.micro"
}
