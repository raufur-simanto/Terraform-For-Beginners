provider "aws" {
  region = "us-east-1"
}

variable "ami" {
  description = "The AMI ID to use for the instance"
  
}

variable "instance_type" {
    description = "The type of instance to create"
    type = map(string)
    default = {
        "staging" = "t2.micro"
        "dev" = "t3.micro"
    }
}

module "ec2_instance"{
    source = "./modules/ec2-instance"
    ami = var.ami
    instance_type = lookup(var.instance_type, "staging", "t2.micro") ## take t2.micro if no value foung for staging
  
}