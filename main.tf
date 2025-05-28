provider "aws" {

  region = var.aws_region

}

resource "aws_vpc" "main" {

   cidr_block = "10.0.0.0/16"


}


resource "aws_subnet" "public" {

   vpc_id                  = aws_vpc.main.id
   cidr_block              = "10.0.1.0/24"
   map_public_ip_on_launch = true
}


resource "aws_internet_gateway" "gw" {

  vpc_id = aws_vpc.main.id


}


resource "aws_route_table" "public" {

  vpc_id = aws_vpc.main.id


  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  
  }
}

resource "aws_route_table_association" "a"  {

  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id

}


resource "aws_security_group" "web" {

  name        = "allow_http_ssh"
  description = "Allow SSH and HTTP (8080)"
  vpc_id      = aws_vpc.main.id
  
  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  
  }



  ingress {

    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


resource "aws_instance" "web_server" {

  ami                         = var.ami_id
  instance_type		      = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true
  user_data                   = file("user_data.sh")
  key_name                    = var.key_name
  

  tags = {

    Name = "nginx-on-8080"

  }
}

