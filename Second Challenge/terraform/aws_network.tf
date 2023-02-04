# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my_vpc"
  }
}

# internet_gateway
resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_internet_gateway"
  }
  depends_on = [
    aws_vpc.my_vpc
  ]
}

# public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.my_internet_gateway.id
  }

  tags = {
    Name = "public_rt"
  }
  depends_on = [
    aws_vpc.my_vpc
  ]
}

# private route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "10.0.1.0/24"
    nat_gateway_id = aws_nat_gateway.my_nat.id
  }

  tags = {
    Name = "private_rt"
  }
  depends_on = [
    aws_vpc.my_vpc
  ]
}

resource "aws_eip" "lb" {
  vpc      = true
}

# nat
resource "aws_nat_gateway" "my_nat" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public_subnet_2.id

  tags = {
    Name = "my_nat"
  }
  depends_on = [ 
    aws_internet_gateway.my_internet_gateway,
    aws_subnet.public_subnet_2
    ]
}

# public subnet 1
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public_subnet_1"
  }
  depends_on = [
    aws_vpc.my_vpc
  ]
}

# public subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "public_subnet_2"
  }
  depends_on = [
    aws_vpc.my_vpc
  ]
}

resource "aws_route_table_association" "rt_association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "rt_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

# private subnet 1
resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "web_portal"
  }
}

# private subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "web_portal"
  }
}

# private subnet 3
resource "aws_subnet" "private_subnet_3" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "web_portal"
  }
}

resource "aws_route_table_association" "rt_association_3" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "rt_association_4" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "rt_association_5" {
  subnet_id      = aws_subnet.private_subnet_3.id
  route_table_id = aws_route_table.private_rt.id
}

# kubernetes machines IPs
resource "aws_network_interface" "master_1_network_interface" {
  subnet_id   = aws_subnet.private_subnet_1.id
  private_ips = ["10.0.3.10"]

  tags = {
    Name = "kubernetes_master_1_ip"
  }
}

resource "aws_network_interface" "master_2_network_interface" {
  subnet_id   = aws_subnet.private_subnet_2.id
  private_ips = ["10.0.4.10"]

  tags = {
    Name = "kubernetes_master_2_ip"
  }
}

resource "aws_network_interface" "master_3_network_interface" {
  subnet_id   = aws_subnet.private_subnet_3.id
  private_ips = ["10.0.5.10"]

  tags = {
    Name = "kubernetes_master_3_ip"
  }
}

resource "aws_network_interface" "worker_1_network_interface" {
  subnet_id   = aws_subnet.private_subnet_1.id
  private_ips = ["10.0.3.20"]

  tags = {
    Name = "kubernetes_worker_1_ip"
  }
}

resource "aws_network_interface" "worker_2_network_interface" {
  subnet_id   = aws_subnet.private_subnet_2.id
  private_ips = ["10.0.4.20"]

  tags = {
    Name = "kubernetes_worker_2_ip"
  }
}

resource "aws_network_interface" "worker_3_network_interface" {
  subnet_id   = aws_subnet.private_subnet_3.id
  private_ips = ["10.0.5.20"]

  tags = {
    Name = "kubernetes_worker_3_ip"
  }
}

# load balancer ips
resource "aws_network_interface" "load_balancer_1_network_interface" {
  subnet_id   = aws_subnet.public_subnet_1.id
  private_ips = ["10.0.1.10"]

  tags = {
    Name = "load_balancer_1_ip"
  }
}

resource "aws_network_interface" "load_balancer_2_network_interface" {
  subnet_id   = aws_subnet.public_subnet_2.id
  private_ips = ["10.0.2.10"]

  tags = {
    Name = "load_balancer_1_ip"
  }
}

# jenkins ips
resource "aws_network_interface" "jenkins_network_interface" {
  subnet_id   = aws_subnet.public_subnet_1.id
  private_ips = ["10.0.1.20"]

  tags = {
    Name = "jenkins_1_ip"
  }
}