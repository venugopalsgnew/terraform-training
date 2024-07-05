provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "name" {
    ami = "ami-06d753822bd94c64e"
    instance_type = "t2.micro"


}

resource "aws_ec2_instance_state" "test" {
  instance_id = aws_instance.name.id
  state       = "stopped"
}

#state = can be stopped or running  ( to start and stop the instances )
