variable "compartment_id" {}
variable "load_balancer_map" {}

resource "oci_load_balancer_load_balancer" "load_balancer" {
  for_each = var.load_balancer_map

  compartment_id             = var.compartment_id
  display_name               = each.value.display_name
  shape                      = each.value.shape
  subnet_ids                 = each.value.subnet_ids
  defined_tags               = each.value.defined_tags
  is_private                 = each.value.is_private
  network_security_group_ids = each.value.network_security_group_ids

  shape_details {
    maximum_bandwidth_in_mbps = each.value.maximum_bandwidth_in_mbps
    minimum_bandwidth_in_mbps = each.value.minimum_bandwidth_in_mbps
  }
}

output "load_balancer_ids" {
  description = "The IDs of the created load balancers"
  value       = { for lb in oci_load_balancer_load_balancer.load_balancer : lb.display_name => lb.id }
}
