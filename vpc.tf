resource "aws_vpc" "myvpc" {
tags = {
Name = "My_Vpc"
}
cidr_block = "10.0.0.0/16"

instance_tenancy = "default"

enable_dns_hostnames = "true"

enable_dns_support = "true"

}



