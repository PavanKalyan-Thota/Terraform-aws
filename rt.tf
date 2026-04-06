resource "aws_route_table" "rt" {
tags = {
Name = "route"
}
vpc_id = aws_vpc.myvpc.id
route {

cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.igw.id

}
}

resource "aws_route_table_association" "rta1" {
subnet_id = aws_subnet.mysubnet1.id
route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rta2" {
subnet_id = aws_subnet.mysubnet2.id
route_table_id = aws_route_table.rt.id
}

