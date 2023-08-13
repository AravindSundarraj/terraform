variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "vpc_name" {
  type    = string
  default = "demo_vpc"
}

variable "ins_name" {
  type    = string
  default = "demo_instance"
}

variable "sec_name_px" {
  type    = string
  default = "ins_sec_px"
}
