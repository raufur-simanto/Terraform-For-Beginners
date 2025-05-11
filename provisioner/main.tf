## Create all the necessary resources to run an application in aws ec2 instance

provider "aws" {
  region = "us-east-1"
} 

variable "cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer"
  public_key = file("/home/shimanto/.ssh/id_rsa.pub")
}

resource "aws_vpc" "main" {
  cidr_block = var.cidr

  tags = {
    Name = "main-vpc"
  }
}
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}
resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/24" 
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_route_table" "RT" {
    vpc_id = aws_vpc.main.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id
    }
}

resource "aws_route_table_association" "rta1" {
    subnet_id      = aws_subnet.main.id
    route_table_id = aws_route_table.RT.id
}
resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  } 
    tags = {
        Name = "allow_ssh"
    }
}
resource "aws_security_group" "allow_http" {
  vpc_id = aws_vpc.main.id

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
    tags = {
        Name = "allow_http"
    }
}

resource "aws_instance" "web" {
  ami                    = "ami-0261755bbcb8c4a84"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.main.id
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_http.id]

  tags = {
    Name = "web-instance"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/home/shimanto/.ssh/id_rsa")
    host        = self.public_ip
  }
  ## file provisioner to copy app.py from local to remote instance
  provisioner "file" {
    source      = "app.py"
    destination = "/home/ubuntu/app.py"
  }
    ## remote-exec provisioner to run the app.py file
    provisioner "remote-exec" {
        inline = [
            "sudo apt update -y",
            "sudo apt-get install python3 -y",
            "sudo apt-get install python3-pip -y",
            "cd /home/ubuntu",
            "sudo pip3 install flask",
            "python3 app.py &",
        ]
    }    
}