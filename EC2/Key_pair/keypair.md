# Generate .pem file with the below command

# ssh-keygen -t rsa -b 2048 -f testkey.pem -- Using public key of this command output in below 

```
resource "aws_key_pair" "deployer" {
  key_name   = "testkey"
  #public_key = "<testkey.pem.pub> key content"
  public_key = file("testkey.pem.pub")
}

resource "aws_instance" "web1" {
  ami           = "ami-05a5f6298acdb05b6"
  instance_type = "t2.micro"
  key_name = "testkey"
  depends_on = [aws_key_pair.deployer]

  tags = {
    Name = "HelloWorld"
  }
}
```


