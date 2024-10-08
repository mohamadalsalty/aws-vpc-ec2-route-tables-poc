resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true


  tags = {
    Name = "10.0.2.0 - eu-central-1a"
  }

  depends_on = [aws_vpc.custom_vpc]
}