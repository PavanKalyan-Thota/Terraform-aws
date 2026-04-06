resource "aws_security_group" "sg"{
tags = {
Name = "my_sg"
}
description = " it is  my security group create to execute security policies"
vpc_id = aws_vpc.myvpc.id

ingress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}

