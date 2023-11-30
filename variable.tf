variable "compartment_ocid" {
  type    = string
  default = "ocid1.compartment.oc1..aaaaaaaageucoqjnr3yozo6x3szqfsydhbq3435mpbaq6kzljrk6upgzvqyq"
}

variable "load_balancer_map" {
  description = "Map of load balancer configurations"
  type = map(object({
    display_name               = string
    shape                      = string
    subnet_ids                 = list(string)
    defined_tags               = map(string)
    is_private                 = bool
    network_security_group_ids = list(string)
    maximum_bandwidth_in_mbps  = number
    minimum_bandwidth_in_mbps  = number
  }))
  default = {
    "lb1" = {
      display_name               = "ESL_LB"
      shape                      = "100Mbps"
      subnet_ids                 = ["ocid1.subnet.oc1.eu-frankfurt-1.aaaaaaaasqmfx3joposilx5hjkpzhqlw2vq6my4t2npwycq5swxokyreg4aa"]
      defined_tags               = {}
      is_private                 = false
      network_security_group_ids = []
      maximum_bandwidth_in_mbps  = 100
      minimum_bandwidth_in_mbps  = 10
    }
  }
}

variable "load_balancer_backend_set_map" {
  description = "Map of backend set configurations"
  type = map(object({
    health_check_protocol = string
    health_check_port     = number
    load_balancer_name    = string
    display_name          = string
    policy                = string
  }))
  default = {
    "backendset1" = {
      health_check_protocol = "TCP"
      health_check_port     = 22
      load_balancer_name    = "ESL_LB"
      display_name          = "ESL_BACKEND_SET"
      policy                = "ROUND_ROBIN"
    }
  }
}

variable "load_balancer_backend_map" {
  description = "Map of backend configurations"
  type = map(object({
    backendset_name    = string
    backend_ip_address = string
    load_balancer_name = string
    backend_port       = number
  }))
  default = {
    "backend1" = {
      backendset_name    = "ESL_BACKEND_SET"
      backend_ip_address = "192.0.2.1"
      load_balancer_name = "ESL_LB"
      backend_port       = 8080
    }
  }
}

variable "load_balancer_listener_map" {
  description = "Map of listener configurations"
  type = map(object({
    backendset_name    = string
    load_balancer_name = string
    listener_name      = string
    listener_port      = number
    listener_protocol  = string
  }))
  default = {
    "listener1" = {
      backendset_name    = "ESL_BACKEND_SET"
      load_balancer_name = "ESL_LB"
      listener_name      = "ESL_LISTENER"
      listener_port      = 80
      listener_protocol  = "HTTP"
    }
  }
}
