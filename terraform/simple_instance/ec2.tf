provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "4cac55cf13a9fc0709c1e0b2e228358ba4d48da3"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-12-02 23:06:41"
    git_last_modified_by = "92736005+fsengil-panw@users.noreply.github.com"
    git_modifiers        = "92736005+fsengil-panw"
    git_org              = "fsengil-panw"
    git_repo             = "terragoat"
    yor_trace            = "f9e13d11-60c6-4d58-b4a1-8fe6d11098fa"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "4cac55cf13a9fc0709c1e0b2e228358ba4d48da3"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-12-02 23:06:41"
    git_last_modified_by = "92736005+fsengil-panw@users.noreply.github.com"
    git_modifiers        = "92736005+fsengil-panw"
    git_org              = "fsengil-panw"
    git_repo             = "terragoat"
    yor_trace            = "55232793-c501-4019-a0e6-188dcb4032a0"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
