variable compartment_id {}
variable compartment_name {}
variable compartment_description {}

resource "oci_identity_compartment" "esl_compartment_sbx" {
    compartment_id = var.compartment_id
    description = var.compartment_description
    name = var.compartment_name
}

output "compartment_id" {
  description = "The OCID of the compartment."
  value       = oci_identity_compartment.esl_compartment_sbx.id
}