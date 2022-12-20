terraform {
  #테라폼 버전 지정 
  required_version = ">=1.0.0, <2.0.0"
  #공급자 버전 지정 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " ~> 4.0"
    }
  }
}


provider "aws" {
  region = "ap-northeast-2"
}
#리소스 블럭 
resource "aws_instance" "example" {
  ami           = "ami-0ab04b3ccbadfae1f" #ubuntu 20.04version
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name = "aws07-key"
  user_data = <<-EOF
					#!/bin/bash
					echo "Hello, World" > index.html
					nohup busybox httpd -f -p ${var.server_port} & #보간법 
					EOF


  tags = {
    Name = "aws07-terraform-example"
  }
}
# 보안그룹 설정 8080 포트open 
resource "aws_security_group" "instance" {
  name = "aws07-terrafrom-example-instance"
# 인바운드 규칙 설정 
  ingress {
    from_port   = var.server_port #출발 포트 
    to_port     = var.sever_port #도착 포트 
    protocol    = "tcp" #프로토콜 
    cidr_blocks = ["0.0.0.0/0"] # 송신지 
  }
}







# public Ip Output
output "public-ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP of the Instance"
}



