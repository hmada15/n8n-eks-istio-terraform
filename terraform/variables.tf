variable "env" {
  default = "staging"
  type    = string
}
variable "region" {
  default = "us-east-2"
  type    = string
}
variable "zone1" {
  default = "us-east-2a"
  type    = string
}
variable "zone2" {
  default = "us-east-2b"
  type    = string
}
variable "eks_name" {
  default = "demo"
  type    = string
}
variable "eks_version" {
  default = "1.30"
  type    = string
}
variable "terraform_tags" {
  description = "tag all resources"
  type        = map(any)
  default = {
    "provisioner" : "terraform"
  }
}
