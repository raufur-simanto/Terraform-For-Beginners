provider "aws" {
  region = "us-east-1"
}

variable "ami"{
    description = "this is for ec2 instance"
}


variable "instance_type"{
    description = "this is for ec2 instance"
}

resource "aws_instance" "example" {
    ami = var.ami
    instance_type = var.instance_type
  
}