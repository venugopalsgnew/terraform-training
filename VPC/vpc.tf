#Create AWS VPC
resource "aws_vpc" "myvpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"

  tags = {
    Name = "myvpc"
  }
}

# Public Subnets in Custom VPC
resource "aws_subnet" "myvpc-public-1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "myvpc-public-1"
  }
}

# Private Subnets in Custom VPC
resource "aws_subnet" "myvpc-private-1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "myvpc-private-1"
  }
}

# Custom internet Gateway
resource "aws_internet_gateway" "my-gw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "my-gw"
  }
}

#Routing Table for the Custom VPC
resource "aws_route_table" "my-public" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-gw.id
  }

  tags = {
    Name = "my-public-1"
  }
}

resource "aws_route_table_association" "my-public-1-a" {
  subnet_id      = aws_subnet.myvpc-public-1.id
  route_table_id = aws_route_table.my-public.id
}

#Define External IP 
resource "aws_eip" "my-nat" {
  vpc = true
}


resource "aws_nat_gateway" "my-nat-gw" {
  allocation_id = aws_eip.my-nat.id
  subnet_id     = aws_subnet.myvpc-public-1.id
  depends_on    = [aws_internet_gateway.my-gw]
}

resource "aws_route_table" "my-private" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-nat-gw.id
  }

  tags = {
    Name = "my-private"
  }
}

# route associations private
resource "aws_route_table_association" "my-private-1-a" {
  subnet_id      = aws_subnet.myvpc-private-1.id
  route_table_id = aws_route_table.my-private.id
}


#To Create SG which allows port 22 from external to the Instance

resource "aws_security_group" "lab_sg" {
   name        = "lab_sg"
   description = "Allow SSH traffic"
   vpc_id      = aws_vpc.myvpc.id

  ingress {
     description      = "Allow SSH"
     from_port        = 22
     to_port          = 22
     protocol         = "tcp"
     cidr_blocks      = [aws_vpc.myvpc.cidr_block, "0.0.0.0/0"]
   }

   egress {
     from_port        = 0
     to_port          = 0
     protocol         = "-1"
     cidr_blocks      = ["0.0.0.0/0"]
   }

   tags = {
     Name = "allow_ssh"
   }
 }

#To create Security group for DB Server to accept incoming traffic only from WEB Server

resource "aws_security_group" "lab_sg_db" {
   name        = "lab_sg_db"
   description = "Allow SSH traffic from web server"
   vpc_id      = aws_vpc.myvpc.id

  ingress {
     description      = "Allow SSH"
     from_port        = 22
     to_port          = 22
     protocol         = "tcp"
     security_groups = [aws_security_group.lab_sg.id]
     #cidr_blocks      = [aws_security_group.lab_sg.id]
   }

   egress {
     from_port        = 0
     to_port          = 0
     protocol         = "-1"
     cidr_blocks      = ["0.0.0.0/0"]
   }

   tags = {
     Name = "allow_ssh"
   }
 }

# Create EC2 Server ( for Web )
resource "aws_instance" "Lab_Web_Server" {
   ami = "ami-0fc5d935ebf8bc3bc"
   instance_type = "t2.micro"
   key_name = "web"
   subnet_id = aws_subnet.myvpc-public-1.id
   vpc_security_group_ids = [aws_security_group.lab_sg.id]
   associate_public_ip_address = true
   
   
   tags = {
     Name = "Lab_Web_Server"
   }
 }

# Create DB Server

resource "aws_instance" "DB_Server" {
   ami = "ami-0fc5d935ebf8bc3bc"
   instance_type = "t2.micro"
   key_name = "web"
   subnet_id = aws_subnet.myvpc-private-1.id
   vpc_security_group_ids = [aws_security_group.lab_sg_db.id]
   associate_public_ip_address = false
   
   
   tags = {
     Name = "Lab_DB_Server"
   }
 }