variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b"]
}
variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  type = map(string)
  default = {
    ubuntu        = "ami-04542995864e26699"
    amazon_linux  = "ami-00f34bf9aeacdf007"
    windows       = "ami-0954c42276330704a"
  }
}