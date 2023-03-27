resource "aws_vpc" "default" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "public" {
  count                   = var.availability_zone_count
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 8, var.public_subnet_cidr_block_offset + count.index)
  availability_zone       = module.availability_zones.names[count.index]
  vpc_id                  = aws_vpc.default.id
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  count             = var.availability_zone_count
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 8, var.private_subnet_cidr_block_offset + count.index)
  availability_zone = module.availability_zones.names[count.index]
  vpc_id            = aws_vpc.default.id
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.default.id
}

resource "aws_eip" "gateway" {
  count      = var.availability_zone_count
  vpc        = true
  depends_on = [aws_internet_gateway.gateway]
}

resource "aws_nat_gateway" "gateway" {
  count         = var.availability_zone_count
  subnet_id     = element(aws_subnet.public.*.id, count.index)
  allocation_id = element(aws_eip.gateway.*.id, count.index)
}

resource "aws_route_table" "private" {
  count  = var.availability_zone_count
  vpc_id = aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.gateway.*.id, count.index)
  }
}

resource "aws_route_table_association" "private" {
  count          = var.availability_zone_count
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}