variable "tenancy_ocid" {
  type    = string
  default = "ocid1.tenancy.oc1..aaaaaaaaoke44mvitcta5ienql6pxjpwociisopw5ukaqe4ysrjb2jud75la"
}

variable "compartment_display_name" {
  type    = string
  default = "TEST"
}

variable "compartment_description" {
  type    = string
  default = "TEST"
}

variable "vcn_cidr_block" {
  type    = string
  default = "10.123.21.0/24"
}

variable "vcn_display_name" {
  type    = string
  default = "TEST"
}

variable "vcn_dns_label" {
  type    = string
  default = "TEST"
}

variable "pri_cidr_block" {
  type    = string
  default = "10.123.21.0/26"
}

variable "pri_display_name" {
  type    = string
  default = "TEST"
}

variable "pri_dns_label" {
  type    = string
  default = "TEST"
}

variable "defined_tags" {
  description = "Defined tags for the compartment"
  type        = map(string)
  default = {
    "INR" = "Indian Rupee"
    "USD" = "United States Dollar"
  }
}
