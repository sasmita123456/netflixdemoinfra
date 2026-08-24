provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-0b6d9d3d33ba97d99"
  instance_type          = "t2.medium"
  key_name               = "my-server"
  subnet_id              = "subnet-0c7414134a4f95af1"

  vpc_security_group_ids = ["sg-0e493b2a19a06e8ea"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "monitoring-server"]
}

resource "aws_s3_bucket" "one" {
  bucket = "terraform-bucket-dev-321"
  versioning {
    enabled = true
  }
}
