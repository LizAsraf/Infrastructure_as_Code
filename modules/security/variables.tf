variable "enviroment" {
  type        = string
}

variable "tags" {
  description = "Tags to set on the network variables."
  type        = map(string)
  default     ={
    bootcamp = "15"
    createdby = "liz.asraf"
    managedby = "terraform"
  }
}

variable "vpcid" {
  description = "vpcid"
  type        = string
} 

variable "vpcname" {
  description = "vpcname"
  type        = string
}
