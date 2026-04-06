resource "aws_subnet" "mysubnet1" {

vpc_id = aws_vpc.myvpc.id

tags = {
Name = "my_subnet1"
}
availability_zone = "us-east-1a"

cidr_block = "10.0.0.0/20"

map_public_ip_on_launch = "true"

}

resource "aws_subnet" "mysubnet2" {

vpc_id = aws_vpc.myvpc.id

tags = {
Name = "my_subnet2"
}
availability_zone = "us-east-1b"

cidr_block = "10.0.16.0/20"

map_public_ip_on_launch = "true"
}
