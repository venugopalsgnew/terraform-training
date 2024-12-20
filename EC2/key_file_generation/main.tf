

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "tf-key-pair" {
  key_name   = "kodecraft-pair"
  public_key = tls_private_key.rsa.public_key_openssh # This uploads the public key to AWS under the specific keyname,enabling secure access to EC2 Instance
}

resource "local_file" "tf-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tf-key-pair-1"
}


resource "aws_instance" "prodec2" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  key_name      = "kodecraft-pair"

  tags = {
    name = "key_pair_with_ec2"
  }

}

