resource "aws_security_group" "primary_sg" {
  name        = var.primary_sg_name
  description = "Allow SSH and ICMP from the VPCs"
  vpc_id      = aws_vpc.primary_vpc.id
  provider    = aws.primary

  ingress {
    description = "SSH from peer VPCs"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.secondary_vpc_cidr, var.tertiary_vpc_cidr]
  }

  ingress {
    description = "ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.secondary_vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "PRIMARY-SG"
  }
}

resource "aws_security_group" "secondary_sg" {
  name        = var.secondary_sg_name
  description = "Allow SSH and ICMP from the VPCs"
  vpc_id      = aws_vpc.secondary_vpc.id
  provider    = aws.secondary

  ingress {
    description = "SSH from peer VPCs"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.primary_vpc_cidr, var.tertiary_vpc_cidr]
  }

  ingress {
    description = "ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.primary_vpc_cidr, var.tertiary_vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SECONDARY-SG"
  }
}

resource "aws_security_group" "tertiary_sg" {
  name        = var.tertiary_sg_name
  description = "Allow SSH and ICMP from the VPCs"
  vpc_id      = aws_vpc.tertiary_vpc.id
  provider    = aws.tertiary

  ingress {
    description = "SSH from peer VPCs"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.primary_vpc_cidr, var.secondary_vpc_cidr]
  }

  ingress {
    description = "ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.primary_vpc_cidr, var.secondary_vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TERTIARY-SG"
  }
}
