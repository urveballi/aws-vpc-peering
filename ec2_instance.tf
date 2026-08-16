resource "aws_instance" "primary_instance" {
  ami                    = data.aws_ami.primary_ami.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.primary_subnet.id
  vpc_security_group_ids = [aws_security_group.primary_sg.id]
  key_name               = var.primary_key_name
  associate_public_ip_address = true
  provider               = aws.primary

  tags = {
    Name = "PRIMARY-EC2"
  }
}

resource "aws_instance" "secondary_instance" {
  ami                    = data.aws_ami.secondary_ami.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.secondary_subnet.id
  vpc_security_group_ids = [aws_security_group.secondary_sg.id]
  key_name               = var.secondary_key_name
  associate_public_ip_address = true
  provider               = aws.secondary

  tags = {
    Name = "SECONDARY-EC2"
  }
}

resource "aws_instance" "tertiary_instance" {
  ami                    = data.aws_ami.tertiary_ami.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.tertiary_subnet.id
  vpc_security_group_ids = [aws_security_group.tertiary_sg.id]
  key_name               = var.tertiary_key_name
  associate_public_ip_address = true
  provider               = aws.tertiary

  tags = {
    Name = "TERTIARY-EC2"
  }
}
