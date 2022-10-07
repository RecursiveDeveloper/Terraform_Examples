provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "linux2" {
    instance_type   = "t2.micro"
    ami             = "ami-026b57f3c383c2eec"
    
    tags = {
        Name = "Helloworld"
    }

    vpc_security_group_ids = [aws_security_group.instance.id]

    user_data = <<-EOF
                #!/bin/bash
                sudo amazon-linux-extras install -y nginx1.12
                sudo systemctl start nginx
                EOF
}

resource "aws_security_group" "instance" {
    name = "terraform-example-sg"

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"] 
    }
}