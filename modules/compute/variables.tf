variable "enviroment" {
  type        = string
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default = "t2.micro"
}

variable "instances_per_subnet" {
  description = "instances per subnet"
  type        = number
}

variable "tags" {
  description = "Tags to set on the computed variables."
  type        = map(string)
  default     = {
    bootcamp = "15"
    created_by = "liz.asraf"
    managed_by = "terraform"
  }
}

variable "volume_tags" {
  description = "Tags to set on the instance variables."
  type        = map(string)
  default     = {
    bootcamp = "15"
    created_by = "liz.asraf"
    managed_by = "terraform"
  }
}

variable "ami" {
  description = "image to create instance"
  type        = string
}

variable "keyname" {
  description = "key for the aws"
  type        = string
  default     = "lizasraf"
}

variable "security_groups" {
  description = "security_groups"
}

variable "subnet" {
  description = "subnet"
  type        = list
}