resource "aws_internet_gateway" "igw" {
tags = {
Name = "int_gwy"
}
vpc_id = aws_vpc.myvpc.id

}
