provider "aws" {
    region = "us-east-1"
  
}
variable "ami" {
    type = map
    default = {
        "us-east-1" = "ami-one"
        "us-west-1" = "ami-two"
        "us-north-1"= "ami-three"
       }
  
}
variable "env" {
    default = "production"
  
}
variable "tags" {
    type = list
    default = ["ec2-one","ec2-2","ec2-3"]
  
}
resource "aws_instance" "name" {
    ami = lookup(var.ami,"us-east-1")
    instance_type = var.env == "production"?"t2.micro":"t2.large"
    count = length(var.tags)

    tags = {
      name = element(var.tags,count.index)
      time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
      
    }

  
}