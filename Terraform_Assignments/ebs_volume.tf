resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1"
  size              = 2
  type  = "gp3"

  tags = {
    Name = "nautilus-volume"
  }
}
