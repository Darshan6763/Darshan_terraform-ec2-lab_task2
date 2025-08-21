# Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group-darshan"
  description = "Allow SSH, HTTP, and custom 8080"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow custom app port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "ubuntu_ec2" {
  ami           = "ami-042b4708b1d05f512" # Ubuntu 22.04 LTS for eu-north-1
  instance_type = "t3.micro"
  key_name      = "darshan-8" # Ensure this key pair exists in your AWS account
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "Darshan_Terraform-Ubuntu-EC2"
  }
}
