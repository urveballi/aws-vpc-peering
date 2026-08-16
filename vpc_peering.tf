resource "aws_vpc_peering_connection" "primary_to_secondary" {
  peer_vpc_id = aws_vpc.secondary_vpc.id
  vpc_id      = aws_vpc.primary_vpc.id
  auto_accept = false
  peer_region = var.secondary
  provider     = aws.primary

  tags = {
    Name = "primary-to-secondary-peering"
  }
}

resource "aws_vpc_peering_connection_accepter" "secondary_accept" {
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary.id
  auto_accept               = true
  provider                  = aws.secondary
}

resource "aws_vpc_peering_connection" "primary_to_tertiary" {
  peer_vpc_id = aws_vpc.tertiary_vpc.id
  vpc_id      = aws_vpc.primary_vpc.id
  auto_accept = false
  peer_region = var.tertiary
  provider     = aws.primary

  tags = {
    Name = "primary-to-tertiary-peering"
  }
}

resource "aws_vpc_peering_connection_accepter" "tertiary_accept_from_primary" {
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_tertiary.id
  auto_accept               = true
  provider                  = aws.tertiary
}

resource "aws_vpc_peering_connection" "secondary_to_tertiary" {
  peer_vpc_id = aws_vpc.tertiary_vpc.id
  vpc_id      = aws_vpc.secondary_vpc.id
  auto_accept = false
  peer_region = var.tertiary
  provider     = aws.secondary

  tags = {
    Name = "secondary-to-tertiary-peering"
  }
}

resource "aws_vpc_peering_connection_accepter" "tertiary_accept_from_secondary" {
  vpc_peering_connection_id = aws_vpc_peering_connection.secondary_to_tertiary.id
  auto_accept               = true
  provider                  = aws.tertiary
}

