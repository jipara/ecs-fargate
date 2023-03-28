output "vpc_id" {
  value = aws_vpc.default.id
}

output "aws_subnet_pub_id" {
    value = aws_subnet.public.*.id
}

output "aws_subnet_private_id" {
    value = aws_subnet.private.*.id
}
