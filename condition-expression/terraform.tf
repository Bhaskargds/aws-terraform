provider "aws" {
    region = "us-east-1"
  
}
variable "environ" {
    default = "production"

  
}
variable "region" {
    default = "us-east-2"
  
}
resource "aws_instance" "ec2" {
    ami = "ami-0ebfd941bbafe70c6"
    instance_type = var.environ == "production" && var.region == "us-east-1" ? "t2.micro":"t2.large"
  
}