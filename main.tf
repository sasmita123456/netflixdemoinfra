provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = ""
  instance_type          = ""
  key_name               = ""
  subnet_id              = ""

  vpc_security_group_ids = [""]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "monitoring-server"]
}


