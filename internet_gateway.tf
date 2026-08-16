resource "aws_internet_gateway" "primary_igw" {
  vpc_id   = aws_vpc.primary_vpc.id
  provider  = aws.primary

  tags = {
    Name = "PRIMARY-IGW-${var.primary}"
  }
}

resource "aws_internet_gateway" "secondary_igw" {
  vpc_id   = aws_vpc.secondary_vpc.id
  provider  = aws.secondary

  tags = {
    Name = "SECONDARY-IGW-${var.secondary}"
  }
}

resource "aws_internet_gateway" "tertiary_igw" {
  vpc_id   = aws_vpc.tertiary_vpc.id
  provider  = aws.tertiary

  tags = {
    Name = "TERTIARY-IGW-${var.tertiary}"
  }
}
