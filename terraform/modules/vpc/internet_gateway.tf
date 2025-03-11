resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.terraform_tags, {
    Name = "igw"
  })
}
