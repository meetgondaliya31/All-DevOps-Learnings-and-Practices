variable "instance_type" {
  default = "t3.micro"
  type    = string
}


variable "default_storage_size" {
  default = 8
  type    = number
}


variable "aws_ami" {
  default = "ami-0e5497a77ef21b5ac"
  type    = string
}

variable env {
  default = "dev"
  type = string
}
