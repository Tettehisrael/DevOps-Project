resource "aws_vpc" "jenkins-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

resource "aws_subnet" "jenkins-subnet" {
  vpc_id            = aws_vpc.jenkins-vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.avail_zone

  tags = {
    Name = "${var.env_prefix}-subnet"
  }
}

resource "aws_internet_gateway" "jenkins-igw" {
  vpc_id = aws_vpc.jenkins-vpc.id

  tags = {
    Name = "${var.env_prefix}-igw"
  }
}

resource "aws_route_table" "jenkins-rtb" {
  vpc_id = aws_vpc.jenkins-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins-igw.id
  }
  tags = {
    Name = "${var.env_prefix}-main-rtb"
  }
}
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.jenkins-subnet.id
  route_table_id = aws_route_table.jenkins-rtb.id
}