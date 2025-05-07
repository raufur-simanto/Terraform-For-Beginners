provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "test" {
  ami                     = "ami-0f88e80871fd81e91"
  instance_type           = "t2.micro"
  subnet_id               = "subnet-070ffc20c9ce142aa"
}