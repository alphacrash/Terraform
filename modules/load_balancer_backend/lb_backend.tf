variable "load_balancer_ids" {}
variable "load_balancer_backend_map" {}

resource "oci_load_balancer_backend" "backend" {
  for_each = var.load_balancer_backend_map

  backendset_name  = each.value.backendset_name
  ip_address       = each.value.backend_ip_address
  load_balancer_id = var.load_balancer_ids[each.value.load_balancer_name]
  port             = each.value.backend_port
}
