resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Example AMI
  instance_type = "t2.micro"

  # Using element function to get the first availability zone
  #availability_zone = element(var.availability_zones, 0)
  availability_zone = var.availability_zones[0]  # First availability zone

  tags = {
    Name = "MyInstance"
  }
}


variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]  # Example AZs
}



