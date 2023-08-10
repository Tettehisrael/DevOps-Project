resource "aws_instance" "jenkins-server" {
  ami                         = "ami-053b0d53c279acc90" #ubuntu
  instance_type               = var.instance_type
  key_name                    = "jenkins"
  subnet_id                   = aws_subnet.jenkins-subnet.id
  vpc_security_group_ids      = [aws_security_group.jenkins-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("jenkins-script.sh")
  tags = {
    Name = "${var.env_prefix}-server"
  }
}