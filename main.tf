provider "aws"{
 region = "eu-central-1"
}

resource "aws_instance" "example" {
 ami = "ami-df8406b0"
 instance_type = "t2.micro"
 
 tags {
   Name = "${var.server_name}"
 }
}

resource "aws_eip" "example" {
 instance = "${aws_instance.example.id}"
}

variable "server_name" {
 description =  "the name of EC2 instance"
 default = "example-test"
}

output "public_ip" {
 value = "${aws_instance.example.public_ip}"
}
