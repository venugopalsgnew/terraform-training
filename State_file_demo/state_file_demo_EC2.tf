
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "prod server"
  }
}


variable "ami" {
   default = "ami-07d9b9ddc6cd8dd30"
} 

variable "instance_type" {
  default = "t2.micro"
}






