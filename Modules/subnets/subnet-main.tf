variable compartment_id {}
variable vcn_id {}
variable subnet_cidr_block {}
variable subnet_display_name {}
variable subnet_dns_label {}

resource oci_core_subnet "ecom_subnet" {
    cidr_block = var.subnet_cidr_block
    compartment_id = var.compartment_id
    vcn_id = var.vcn_id
    display_name = var.subnet_display_name
    dns_label = var.subnet_dns_label
    prohibit_public_ip_on_vnic = true
}