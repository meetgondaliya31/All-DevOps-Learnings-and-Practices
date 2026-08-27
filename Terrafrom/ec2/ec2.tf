# Key pair (login)

resource "aws_key_pair" "my_key" {
  key_name   = "terra-key"
  public_key = file("terra-key.pub")
}


# VPC & Security groups

resource "aws_default_vpc" "default_vpc" {

}


resource "aws_security_group" "my-sec-group" {
  name        = "my-sec-group"
  description = "this is aws security group"
  vpc_id      = aws_default_vpc.default_vpc.id #interpolation

  #inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSh open"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Flask app open"
  }


  #outbound rules

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "my-sec-group"
  }
}





# EC2

resource "aws_instance" "my_ec2" {
  for_each               = tomap ({
    instance-1 = "t3.micro"
    instance-2 = "t3.small"
  })
  depends_on = [ aws_security_group.my-sec-group, aws_key_pair.my_key ]
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my-sec-group.id]
  instance_type          = each.value
  ami                    = var.aws_ami
  # subnet_id = "subnet-04649380451550569"
  user_data = file("install_nginx.sh")


  root_block_device {
    volume_size = var.env == "prod" ? 10 : var.default_storage_size
    volume_type = "gp3"
  }

  tags = {
    Name = each.key
  }
}


# import instance from aws

# resource "aws_instance" "new_my_ec2" {
#     instance_type = "unknown"
#     ami = "unknown"
# }




# import removed terraform made instance from aws

# import {
#   to = aws_instance.new_my_ec2
#   id = "i-0f9c7b82d7dfbdccf"
# }

# resource "aws_instance" "new_my_ec2" {
#   # Define matching attributes (AMI, instance_type, etc.)
#   ami           = "ami-0e5497a77ef21b5ac"
#   instance_type = "t3.small"
# }





































# just another example...

# #  key pair
# resource "aws_key_pair" "test-key-pair" {
#   key_name   = "test-key"
#   public_key = file("terra-key.pub")
# }

# # filter for ubuntu image
# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"]
# }

# # vpc & sg
# resource "aws_default_vpc" "test-vpc" {
# }

# resource "aws_security_group" "test-sg" {
#   name        = "test-sg-ec2"
#   description = "create test-sg for demo"
#   vpc_id      = aws_default_vpc.test-vpc.id
# }

# resource "aws_vpc_security_group_ingress_rule" "test_ssh" {
#   security_group_id = aws_security_group.test-sg.id
#   cidr_ipv4         = aws_default_vpc.test-vpc.cidr_block
#   from_port         = 22
#   ip_protocol       = "tcp"
#   to_port           = 22
# }

# resource "aws_vpc_security_group_ingress_rule" "test_http" {
#   security_group_id = aws_security_group.test-sg.id
#   cidr_ipv4         = aws_default_vpc.test-vpc.cidr_block
#   from_port         = 80
#   ip_protocol       = "tcp"
#   to_port           = 80
# }

# # out bound or egress
# resource "aws_vpc_security_group_egress_rule" "test_all_traffic" {
#   security_group_id = aws_security_group.test-sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1"
# }

# resource "aws_instance" "test-ec2" {
#   ami                    = data.aws_ami.ubuntu.id
#   instance_type          = "t3.micro"
#   vpc_security_group_ids = [aws_security_group.test-sg.id]
#   key_name               = aws_key_pair.test-key-pair.key_name
#   subnet_id              = "subnet-0d87e78e10c9b1023"

#   root_block_device {
#     volume_size = 8
#     volume_type = "gp3"
#   }
#   tags = {
#     "Name" = "test-ec2"
#   }
# }

# output "aws_pub_ip" {
#   value = aws_instance.test-ec2.public_ip
# }