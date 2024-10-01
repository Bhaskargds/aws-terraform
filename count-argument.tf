provider "aws" {
    region = "us-east-1"

  
}
resource "aws_instance" "test" {
    ami = "ami-0ebfd941bbafe70c6"
    instance_type = "t2.micro"
    count = 2
    tags = {
        Name = "dev-env-${count.index}"
    }
} 

variable "names" {
    type = list
    default = ["deepu","manjith","mourya"]
}
resource "aws_iam_user" "lb" {
  name = var.names[count.index]
  count = 3
  
  
}

  