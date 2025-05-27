resource "aws_eip" "nat_eip_a" {
    tags = {
        Name = "nat-pub1"
    }
}

resource "aws_eip" "nat_eip_b" {
    tags = {
        Name = "nat-pub2"
    }

}
resource "aws_nat_gateway" "pub_a" {
  allocation_id = aws_eip.nat_eip_a.id
  subnet_id     = aws_subnet.pub1.id
}

resource "aws_nat_gateway" "pub_b" {
  allocation_id = aws_eip.nat_eip_b.id
  subnet_id     = aws_subnet.pub2.id
}
