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



  tags = {
    Name = var.ins_name
    tag_test = "instance_tag_test"
  }
}
