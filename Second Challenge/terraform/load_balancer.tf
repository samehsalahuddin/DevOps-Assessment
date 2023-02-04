resource "aws_instance" "load_balancer_1" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.medium"
  subnet_id = aws_subnet.public_subnet_1.id
  network_interface {
    network_interface_id = aws_network_interface.load_balancer_1_network_interface.id
    device_index         = 0
  }
  key_name = "sameh"
  vpc_security_group_ids = [
      aws_security_group.allow_ssh.id,
      aws_security_group.allow_jenkins.id
  ]
  tags = {
    Name = "load_balancer_1"
  }
  depends_on = [
    aws_subnet.public_subnet_1,
    aws_network_interface.load_balancer_1_network_interface,
    aws_security_group.allow_ssh
  ]
}

resource "aws_instance" "load_balancer_2" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.medium"
  subnet_id = aws_subnet.public_subnet_2.id
  network_interface {
    network_interface_id = aws_network_interface.load_balancer_2_network_interface.id
    device_index         = 0
  }
  key_name = "sameh"
  vpc_security_group_ids = [
      aws_security_group.allow_ssh.id
  ]
  tags = {
    Name = "load_balancer_2"
  }
  depends_on = [
    aws_subnet.public_subnet_2,
    aws_network_interface.load_balancer_2_network_interface,
    aws_security_group.allow_ssh
  ]
}