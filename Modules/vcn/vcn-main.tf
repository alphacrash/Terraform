variable "compartment_id" {}
variable "vcn_cidr_block" {}
variable "vcn_display_name" {}
variable "vcn_dns_label" {}

resource "oci_core_vcn" "ecom_vcn" {
  cidr_blocks    = [var.vcn_cidr_block]
  compartment_id = var.compartment_id
  display_name   = var.vcn_display_name
  dns_label      = var.vcn_dns_label
}

output "vcn_id" {
  description = "The ID of the VCN."
  value       = oci_core_vcn.ecom_vcn.id
}
