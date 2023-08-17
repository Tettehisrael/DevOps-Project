
# Find Ubuntu 22 LTS AMI image in AWS
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

# Create EC2 instance with Ubuntu 22 LTS AMI image
resource "aws_instance" "my_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  # create devops key pair manually before you run terraform
  key_name = "devops"

  subnet_id              = aws_subnet.public_us_east_1a.id
  vpc_security_group_ids = [aws_security_group.my_server_ssh_access.id]

  associate_public_ip_address = true

  tags = {
    Name = "my-server"
  }
}