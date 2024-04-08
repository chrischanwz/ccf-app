variable "terraform_state_bucket" {
  type    = string
  default = "myterrrrraf0rmbucketstate"
}

variable "default_region" {
  type    = string
  default = "ap-southeast-1"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0b829791f3a6d46cc"
}

variable "ami_id" {
  type    = string
  default = "ami-0910e4162f162c238" # Amazon Linux AMI 2. This changes based on your AWS region.
}

variable "instance_type" {
  type    = string
  default = "t3.xlarge"
}

variable "key_name" {
  type    = string
  default = "keypair3"
}

variable "private_subnet_id" {
  type    = string
  default = "subnet-03f14e5de5a2cc8c7"
}



variable "application" {
  type    = string
  default = "ccf"
}

variable "environment" {
  type    = string
  default = "prod"
}

variable "dns_name" {
  type    = string
  default = "ccf"
}

