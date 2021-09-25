terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

resource "aws_instance" "app_server_yuta" {
  ami           = "ami-00cb500575fd9f9be"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-058cda7badca49175"]
  subnet_id = "subnet-05b2284acd7a081db"

  tags = {
    Name = var.instance_name
  }
}
