variable "env" {
  type = string
}
variable "subnet_zone1_id" {
  type = string
}
variable "subnet_zone2_id" {
  type = string
}
variable "eks_name" {
  type = string
}
variable "terraform_tags" {
  type = map(any)
}
