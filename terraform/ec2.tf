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
  description = "Security group for EC2 instance with open ports"

  # SSH access from trusted sources only
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["<trusted-source-CIDR>"]
  }

  # PostgreSQL access from trusted sources only
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["<trusted-source-CIDR>"]
  }

  # RDP access from trusted sources only
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["<trusted-source-CIDR>"]
  }

  # Remove unrestricted HTTP and HTTPS access if not necessary
  # If necessary, limit it to trusted sources as done for SSH, PostgreSQL and RDP

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}