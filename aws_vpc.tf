resource "aws_vpc" "general" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.general.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "subnet1"
  }
}
resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.general.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "subnet2"
  }
}
resource "aws_internet_gateway" "gw1" {
  vpc_id = aws_vpc.general.id

  tags = {
    Name = "gw1"
  }
}
resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.general.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw1.id
  }

  tags = {
    Name = "example"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt1.id
}