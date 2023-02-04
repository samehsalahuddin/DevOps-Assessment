resource "aws_instance" "master_1" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.medium"
  subnet_id = aws_subnet.private_subnet_1.id
  network_interface {
    network_interface_id = aws_network_interface.master_1_network_interface.id
    device_index         = 0
  }
  key_name = "sameh"
  vpc_security_group_ids = [ 
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_k8s.id
  ]

  tags = {
    Name = "kubernetes_Master_1"
  }
  depends_on = [
    aws_subnet.private_subnet_1,
    aws_network_interface.master_1_network_interface,
    aws_security_group.allow_ssh
  ]
}

resource "aws_instance" "master_2" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.medium"
  subnet_id = aws_subnet.private_subnet_2.id
  network_interface {
    network_interface_id = aws_network_interface.master_2_network_interface.id
    device_index         = 0
  }
  key_name = "sameh"
  vpc_security_group_ids = [ 
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_k8s.id
  ]

  tags = {
    Name = "kubernetes_Master_2"
  }
  depends_on = [
    aws_subnet.private_subnet_2,
    aws_network_interface.master_2_network_interface,
    aws_security_group.allow_ssh
  ]
}

resource "aws_instance" "master_3" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.medium"
  subnet_id = aws_subnet.private_subnet_3.id
  network_interface {
    network_interface_id = aws_network_interface.master_3_network_interface.id
    device_index         = 0
  }
  key_name = "sameh"
  vpc_security_group_ids = [ 
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_k8s.id
  ]
  tags = {
    Name = "kubernetes_Master_3"
  }
  depends_on = [
    aws_subnet.private_subnet_3,
    aws_network_interface.master_3_network_interface,
    aws_security_group.allow_ssh
  ]
}

resource "aws_instance" "worker_1" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.medium"
  subnet_id = aws_subnet.private_subnet_1.id
  network_interface {
    network_interface_id = aws_network_interface.worker_1_network_interface.id
    device_index         = 0
  }
  key_name = "sameh"
  vpc_security_group_ids = [ 
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_k8s.id
  ]

  tags = {
    Name = "kubernetes_Worker_1"
  }
  depends_on = [
    aws_subnet.private_subnet_1,
    aws_network_interface.worker_1_network_interface,
    aws_security_group.allow_ssh
  ]
}

resource "aws_instance" "worker_2" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.medium"
  subnet_id = aws_subnet.private_subnet_2.id
  network_interface {
    network_interface_id = aws_network_interface.worker_2_network_interface.id
    device_index         = 0
  }
  key_name = "sameh"
  vpc_security_group_ids = [ 
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_k8s.id
  ]

  tags = {
    Name = "kubernetes_Worker_2"
  }
  depends_on = [
    aws_subnet.private_subnet_2,
    aws_network_interface.worker_2_network_interface,
    aws_security_group.allow_ssh
  ]
}

resource "aws_instance" "worker_3" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.medium"
  subnet_id = aws_subnet.private_subnet_3.id
  network_interface {
    network_interface_id = aws_network_interface.worker_3_network_interface.id
    device_index         = 0
  }
  key_name = "sameh"
  vpc_security_group_ids = [ 
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_k8s.id
  ]

  tags = {
    Name = "kubernetes_Worker_3"
  }
  depends_on = [
    aws_subnet.private_subnet_3,
    aws_network_interface.worker_3_network_interface,
    aws_security_group.allow_ssh
  ]
}