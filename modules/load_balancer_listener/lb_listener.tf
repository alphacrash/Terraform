variable "load_balancer_ids" {}
variable "load_balancer_listener_map" {}

resource "oci_load_balancer_listener" "listener" {
  for_each = var.load_balancer_listener_map

  default_backend_set_name = each.value.backendset_name
  load_balancer_id         = var.load_balancer_ids[each.value.load_balancer_name]
  name                     = each.value.listener_name
  port                     = each.value.listener_port
  protocol                 = each.value.listener_protocol
}
