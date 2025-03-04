resource "aws_instance" "web_server" {
  ami           = var.ami_image_name
  instance_type = var.instance_type
  subnet_id      = aws_subnet.public_subnet.id
  tags = {
    Name = "swap_Terraform-Managed-Instance"
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
 
  tags = {
    Name = "PublicSubnet"
  }
}