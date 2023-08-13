terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "arav_terraform_cloud"

    workspaces {
      name = "test-workspace"
    }
  }
}

provider "aws" {
  region = var.aws_region # Change this to your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI in us-west-2 (Update for your desired AMI)
  instance_type = "t2.micro"              # Change this to your desired instance type
  depends_on = [aws_security_group.tee-securityGroup]


  tags = {
    Name = var.ins_name
  }
  // Use the security group created earlier
  security_groups = [aws_security_group.tee-securityGroup.name]

}

resource "aws_security_group" "tee-securityGroup" {
  name_prefix = var.sec_name_px
  // Ingress rules (incoming traffic)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH access from anywhere (note: restrict this in production)
  }
}
output "log_out" {
  value = aws_security_group.tee-securityGroup.name

}

