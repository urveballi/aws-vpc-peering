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

resource "aws_route" "primary_to_secondary" {
  route_table_id            = aws_route_table.primary_rt.id
  destination_cidr_block    = var.secondary_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary.id
  provider                  = aws.primary
}

resource "aws_route" "primary_to_tertiary" {
  route_table_id            = aws_route_table.primary_rt.id
  destination_cidr_block    = var.tertiary_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_tertiary.id
  provider                  = aws.primary
}

resource "aws_route" "secondary_to_primary" {
  route_table_id            = aws_route_table.secondary_rt.id
  destination_cidr_block    = var.primary_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary.id
  provider                  = aws.secondary
}

resource "aws_route" "secondary_to_tertiary" {
  route_table_id            = aws_route_table.secondary_rt.id
  destination_cidr_block    = var.tertiary_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.secondary_to_tertiary.id
  provider                  = aws.secondary
}

resource "aws_route" "tertiary_to_primary" {
  route_table_id            = aws_route_table.tertiary_rt.id
  destination_cidr_block    = var.primary_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_tertiary.id
  provider                  = aws.secondary
}

resource "aws_route" "tertiary_to_secondary" {
  route_table_id            = aws_route_table.tertiary_rt.id
  destination_cidr_block    = var.secondary_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.secondary_to_tertiary.id
  provider                  = aws.secondary
}

resource "aws_route_table_association" "primary_rta" {
  subnet_id      = aws_subnet.primary.id
  route_table_id = aws_route_table.primary_rt.id
  provider       = aws.primary
}

resource "aws_route_table_association" "secondary_rta" {
  subnet_id      = aws_subnet.secondary.id
  route_table_id = aws_route_table.secondary_rt.id
  provider       = aws.secondary
}

resource "aws_route_table_association" "tertiary_rta" {
  subnet_id      = aws_subnet.tertiary.id
  route_table_id = aws_route_table.tertiary_rt.id
  provider       = aws.secondary
}
