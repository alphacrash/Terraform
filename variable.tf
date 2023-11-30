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
      display_name               = "test_lb1"
      shape                      = "100Mbps"
      subnet_ids                 = ["ocid1.subnet.oc1..exampleuniqueID1", "ocid1.subnet.oc1..exampleuniqueID2"]
      defined_tags               = { "DT-TAGS.backup" = "NA" }
      is_private                 = false
      network_security_group_ids = ["ocid1.networksecuritygroup.oc1..exampleuniqueID1", "ocid1.networksecuritygroup.oc1..exampleuniqueID2"]
      maximum_bandwidth_in_mbps  = 100
      minimum_bandwidth_in_mbps  = 10
    }
    "lb2" = {
      display_name               = "test_lb2"
      shape                      = "100Mbps"
      subnet_ids                 = ["ocid1.subnet.oc1..exampleuniqueID3", "ocid1.subnet.oc1..exampleuniqueID4"]
      defined_tags               = { "DT-TAGS.backup" = "NA" }
      is_private                 = true
      network_security_group_ids = ["ocid1.networksecuritygroup.oc1..exampleuniqueID3", "ocid1.networksecuritygroup.oc1..exampleuniqueID4"]
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
    "bks1" = {
      health_check_protocol = "TCP"
      health_check_port     = 22
      load_balancer_name    = "test_lb1"
      display_name          = "backendset1"
      policy                = "ROUND_ROBIN"
    }
    "bks2" = {
      health_check_protocol = "HTTP"
      health_check_port     = 80
      load_balancer_name    = "test_lb2"
      display_name          = "backendset2"
      policy                = "LEAST_CONNECTIONS"
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
      backendset_name    = "backendset1"
      backend_ip_address = "192.0.2.1"
      load_balancer_name = "test_lb1"
      backend_port       = 8080
    }
    "backend2" = {
      backendset_name    = "backendset2"
      backend_ip_address = "192.0.2.2"
      load_balancer_name = "test_lb2"
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
      backendset_name    = "backendset1"
      load_balancer_name = "test_lb1"
      listener_name      = "listener1"
      listener_port      = 80
      listener_protocol  = "HTTP"
    }
    "listener2" = {
      backendset_name    = "backendset2"
      load_balancer_name = "test_lb2"
      listener_name      = "listener2"
      listener_port      = 443
      listener_protocol  = "HTTPS"
    }
  }
}
