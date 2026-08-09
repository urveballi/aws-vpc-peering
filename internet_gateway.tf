resource "aws_internet_gateway" "primary" {
  vpc_id   = aws_vpc.primary.id
  provider  = aws.primary

  tags = {
    Name = "PRIMARY-IGW-${var.primary}"
  }
}

resource "aws_internet_gateway" "secondary" {
  vpc_id   = aws_vpc.secondary.id
  provider  = aws.secondary

  tags = {
    Name = "SECONDARY-IGW-${var.secondary}"
  }
}

resource "aws_internet_gateway" "tertiary" {
  vpc_id   = aws_vpc.tertiary.id
  provider  = aws.secondary

  tags = {
    Name = "TERTIARY-IGW-${var.tertiary}"
  }
}
