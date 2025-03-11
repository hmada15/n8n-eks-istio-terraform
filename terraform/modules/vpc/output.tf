output "vpc_id" {
  value = aws_vpc.main.id
}
output "subnet_zone1_id" {
  value = aws_subnet.private_zone1.id
}
output "subnet_zone2_id" {
  value = aws_subnet.private_zone2.id
}
