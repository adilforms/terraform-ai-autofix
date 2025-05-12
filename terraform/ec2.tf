provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Example AMI (Amazon Linux 2, update as needed)
  instance_type = "t2.micro"

  tags = {
    Name = "example-ec2"
  }

  vpc_security_group_ids = [aws_security_group.example.id]
}

resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Security group for EC2 instance with specific access"

  # SSH access from specific ip
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["x.x.x.x/32"]    # Replace x.x.x.x with the specific IP(s)
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}