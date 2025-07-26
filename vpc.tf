# Step 1: Create VPC
resource "aws_vpc" "myvpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "MyVPC"
  }
}

# Step 2: Create a Public Subnet in ap-south-1a
resource "aws_subnet" "PublicSubnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet"
  }
}

# Step 3: Create a Private Subnet in ap-south-1b
resource "aws_subnet" "PrivSubnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "PrivateSubnet"
  }
}

# Step 4: Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "MyInternetGateway"
  }
}

# Step 5: Create a Route Table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "MyRouteTable"
  }
}

# Step 6: Associate Route Table with Public Subnet
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.PublicSubnet.id
  route_table_id = aws_route_table.rt.id
}
