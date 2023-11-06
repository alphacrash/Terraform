module "compartment" {
  source                  = "../../Modules/compartment"
  compartment_id          = var.tenancy_ocid
  compartment_name        = var.compartment_display_name
  compartment_description = var.compartment_description
  defined_tags            = var.defined_tags
}

module "vcn_main" {
  source           = "../../Modules/vcn"
  compartment_id   = module.compartment.compartment_id
  vcn_cidr_block   = var.vcn_cidr_block
  vcn_display_name = var.vcn_display_name
  vcn_dns_label    = var.vcn_dns_label
}

module "subnet_pri" {
  source              = "../../Modules/subnets"
  compartment_id      = module.compartment.compartment_id
  vcn_id              = module.vcn_main.vcn_id
  subnet_cidr_block   = var.pri_cidr_block
  subnet_display_name = var.pri_display_name
  subnet_dns_label    = var.pri_dns_label
}
