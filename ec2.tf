data "aws_ami" "ubuntu-useast1" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners   = ["099720109477"] # Canonical
  provider = aws
}


data "aws_ami" "ubuntu-useast2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners   = ["099720109477"] # Canonical
  provider = aws.us-east-2
}

resource "aws_instance" "system1" {

  ami                    = data.aws_ami.ubuntu-useast1.id
  instance_type          = var.instance_type_useast1
  key_name               = module.key_pair1.key_pair_name
  vpc_security_group_ids = [aws_security_group.us-east-1-sg.id]
  subnet_id              = module.vpc1.public_subnets[0]

  root_block_device {
    volume_size           = "30"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = var.instance_name_useast1
  }
  provider = aws
}

resource "aws_instance" "system2" {

  ami                    = data.aws_ami.ubuntu-useast2.id
  instance_type          = var.instance_type_useast2
  key_name               = module.key_pair2.key_pair_name
  vpc_security_group_ids = [aws_security_group.us-east-2-sg.id]
  subnet_id              = module.vpc2.public_subnets[0]

  root_block_device {
    volume_size           = "30"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = var.instance_name_useast2
  }
  provider = aws.us-east-2
}

