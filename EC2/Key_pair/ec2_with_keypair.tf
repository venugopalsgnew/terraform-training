provider "aws" {
  region = "us-east-1"

}


resource "aws_key_pair" "deployer" {
  key_name = "testkey"
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCq2QN7CAMeX0AzN70fOo85JwnEdDeM76zGZjMVT4wSgHz81AuAkPS+GlMtsaPQTRXWpitsmvhNYLwkelzo2lboVcYRx/CEMyAHEEJWj8tUplVq8RiejCFF8OZKAEGNTOP1406CJzZROBuWTUe+6ahjWOYUgAWJxKd0vFt0Dr/cWokUQt+b/TYuJ6hLyk7+oMj216dC3i0B+pOyWFDAU4kHhaV0EW0vShT4ekvbHN2zEaXAJI/SlXtpqPQqROH+cEOIa6/+GQrLKkTWs40dS+xoy3pmJ/msy1o8injBthrHwSRCiDtXqltkLfruNLewzVKT3DW+I/CKk4KZjQ2GtCOx venug@Venu"
  public_key = file("testkey.pem.pub")
}

resource "aws_instance" "web1" {
  ami           = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  key_name      = "testkey"
  depends_on    = [aws_key_pair.deployer]

  tags = {
    Name = "HelloWorld"
  }
}
