data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}

resource "tls_private_key" "aws_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "aws_key_pair" {
  key_name   = "tf_key"
  public_key = tls_private_key.aws_ssh_key.public_key_openssh
}

resource "aws_instance" "web_server" {
  ami = data.aws_ami.ubuntu.id
  tags = {
    Name = "Web Server"
  }
  instance_type          = "t3.nano"
  vpc_security_group_ids = [aws_security_group.web_server.id]
  subnet_id              = aws_subnet.public_subnet.id
  metadata_options {
    http_tokens = "required"
  }
  key_name = aws_key_pair.aws_key_pair.key_name
}

