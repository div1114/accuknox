data "http" "deployer_ip" {
  url = "https://ifconfig.me/ip"
}

locals {
  map = {
    "Deployer IP" = {
      port        = 22,
      cidr_blocks = ["${data.http.deployer_ip.response_body}/32"],
    }
  }
}


resource "aws_security_group" "us-east-1-sg" {
  name        = "us-east-1-sg"
  description = "accuknox us-east-1 SG"
  vpc_id      = module.vpc1.vpc_id

  dynamic "ingress" {
    for_each = local.map
    content {
      description = ingress.key
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    description      = "Allow All Outbound Traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  provider = aws

  tags = {
    Name = "us-east-1-sg"
  }
}


resource "aws_security_group" "us-east-2-sg" {
  name        = "us-east-2-sg"
  description = "accuknox us-east-2 SG"
  vpc_id      = module.vpc2.vpc_id

  dynamic "ingress" {
    for_each = local.map
    content {
      description = ingress.key
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    description      = "Allow All Outbound Traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  provider = aws.us-east-2

  tags = {
    Name = "us-east-2-sg"
  }
}
