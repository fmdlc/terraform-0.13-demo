#-------------------------------------------------------------------------
# Route table definition
#-------------------------------------------------------------------------
# -> Public VPC:
#   - us-east-1a - 10.0.1.0/24 -> 0.0.0.0/0
#   - us-east-1b - 10.0.2.0/24 -> 0.0.0.0/0
#   - us-east-1c - 10.0.3.0/24 -> 0.0.0.0/0
#-------------------------------------------------------------------------

resource "aws_route_table" "route-us-east-1a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name      = "main"
    Terraform = "True"
  }
}

resource "aws_route_table" "route-us-east-1b" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "10.0.2.0/24"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name      = "main"
    Terraform = "True"
  }
}

resource "aws_route_table" "route-us-east-1c" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "10.0.3.0/24"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name      = "main"
    Terraform = "True"
  }
}

resource "aws_route_table_association" "us-east-1a" {
  subnet_id      = aws_subnet.main-us-east-1a.id
  route_table_id = aws_route_table.route-us-east-1b.id
}

resource "aws_route_table_association" "us-east-1b" {
  subnet_id      = aws_subnet.main-us-east-1b.id
  route_table_id = aws_route_table.route-us-east-1b.id
}

resource "aws_route_table_association" "us-east-1c" {
  subnet_id      = aws_subnet.main-us-east-1c.id
  route_table_id = aws_route_table.route-us-east-1c.id
}
