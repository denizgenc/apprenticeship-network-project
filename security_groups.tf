resource "aws_security_group" "sg_1" {
    name = "${var.name_prefix}-sg-1"
    vpc_id = "${aws_vpc.vpc_1.id}"

    ingress {
        description = "SSH ingress from GDS IPs"
        protocol = "tcp"
        from_port = "22"
        to_port = "22"
        cidr_blocks = ["213.86.153.212/32", "213.86.153.213/32", "213.86.153.214/32",
                       "213.86.153.235/32", "213.86.153.236/32", "213.86.153.237/32",
                       "85.133.67.244/32"]
    }

    ingress {
        description = "HTTP ingress - only from GDS for now"
        protocol = "tcp"
        from_port = "80"
        to_port = "80"
        cidr_blocks = ["213.86.153.212/32", "213.86.153.213/32", "213.86.153.214/32",
                       "213.86.153.235/32", "213.86.153.236/32", "213.86.153.237/32",
                       "85.133.67.244/32"]
    }
    
    ingress {
        description = "HTTPS ingress - only from GDS for now"
        protocol = "tcp"
        from_port = "443"
        to_port = "443"
        cidr_blocks = ["213.86.153.212/32", "213.86.153.213/32", "213.86.153.214/32",
                       "213.86.153.235/32", "213.86.153.236/32", "213.86.153.237/32",
                       "85.133.67.244/32"]
    }

    # AWS default egress rule, replicated here (see the bottom of:
    # https://www.terraform.io/docs/providers/aws/r/security_group.html#argument-reference )
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

