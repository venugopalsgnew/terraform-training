provider "aws" {
  region = "us-east-1"  # Update with your desired AWS region
}

# List of instance names
variable "instance_names" {
  default = ["dev", "qa", "prod"]
}


resource "aws_instance" "example_instance" {
  count         = length(var.instance_names)
  ami           = "ami-07d9b9ddc6cd8dd30"  # Example AMI ID (Amazon Linux 2)
  instance_type = "t2.micro"                # Example instance type (micro)

  tags = {
    Name = var.instance_names[count.index]
  }
}
