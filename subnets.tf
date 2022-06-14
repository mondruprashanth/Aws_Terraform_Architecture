resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.my_webapp_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public"
  }
}