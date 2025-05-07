## variable block is used to define input variables

variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t2.micro"
}

variable "ami" {
    description = "AMI for aws EC2 instance"
    type = string
    default = "ami-0f88e80871fd81e91"
}

variable "subnet_id" {
    description = "subnet id"
    type = string
    default = "subnet-070ffc20c9ce142aa"
}

