variable "compartment_id" {}
variable "load_balancer_ids" {}
variable "load_balancer_backend_set_map" {}

resource "oci_load_balancer_backend_set" "backend_set" {
  for_each = var.load_balancer_backend_set_map

  health_checker {
    protocol = each.value.health_check_protocol
    port     = each.value.health_check_port
  }
  load_balancer_id = var.load_balancer_ids[each.value.load_balancer_name]
  name             = each.value.display_name
  policy           = each.value.policy
}
