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
variable "terraform_tags" {
  description = "tag all resources"
  type        = map(any)
  default = {
    "provisioner" : "terraform"
  }
}
