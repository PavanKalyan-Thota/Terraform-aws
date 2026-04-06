resource "aws_launch_template" "lt" {
tags = {
Name = "mytemplate"
}
image_id = "ami-02dfbd4ff395f2a1b"
instance_type = "t3.micro"
network_interfaces {
security_groups = [aws_security_group.sg.id]
}
}

resource "aws_elb" "lb" {
tags = {
Name = "loabbalancer"
}

subnets = [aws_subnet.mysubnet1.id, aws_subnet.mysubnet2.id]

security_groups = [aws_security_group.sg.id]

listener {
instance_port = 8000 
instance_protocol = "http"
lb_port = 80
lb_protocol = "http"
}
}

resource "aws_autoscaling_group" "auto" {

launch_template {
name = aws_launch_template.lt.name
version = "$Latest"
}

min_size = 2
max_size = 4
desired_capacity = 3
health_check_type = "EC2"
load_balancers = [aws_elb.lb.name]
vpc_zone_identifier = [aws_subnet.mysubnet1.id, aws_subnet.mysubnet2.id]
}

