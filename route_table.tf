resource "aws_route_table" "primary_rt" {
  vpc_id   = aws_vpc.primary.id
  provider = aws.primary

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.primary_igw.id
  }

  tags = {
    Name = "PRIMARY-RT"
  }
}

resource "aws_route_table" "secondary_rt" {
  vpc_id   = aws_vpc.secondary.id
  provider = aws.secondary

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.secondary_igw.id
  }

  tags = {
    Name = "SECONDARY-RT"
  }
}

resource "aws_route_table" "tertiary_rt" {
  vpc_id   = aws_vpc.tertiary.id
  provider = aws.secondary

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tertiary_igw.id
  }

  tags = {
    Name = "TERTIARY-RT"
  }
}

resource "aws_route_table_association" "primary_rta" {
  subnet_id      = aws_subnet.primary_subnet.id
  route_table_id = aws_route_table.primary_rt.id
  provider       = aws.primary
}

resource "aws_route_table_association" "secondary_rta" {
  subnet_id      = aws_subnet.secondary_subnet.id
  route_table_id = aws_route_table.secondary_rt.id
  provider       = aws.secondary
}

resource "aws_route_table_association" "tertiary_rta" {
  subnet_id      = aws_subnet.tertiary_subnet.id
  route_table_id = aws_route_table.tertiary_rt.id
  provider       = aws.secondary
}
