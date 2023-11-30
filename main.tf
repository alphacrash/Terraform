module "load_balancers" {
  source            = "./modules/load_balancer"
  compartment_id    = var.compartment_ocid
  load_balancer_map = var.load_balancer_map
}

module "load_balancer_backend_sets" {
  source = "./modules/load_balancer_backend_set"

  compartment_id                = var.compartment_ocid
  load_balancer_ids             = module.load_balancers.load_balancer_ids
  load_balancer_backend_set_map = var.load_balancer_backend_set_map

  depends_on = [module.load_balancers]
}

module "load_balancer_backends" {
  source = "./modules/load_balancer_backend"

  load_balancer_ids         = module.load_balancers.load_balancer_ids
  load_balancer_backend_map = var.load_balancer_backend_map

  depends_on = [module.load_balancers, module.load_balancer_backend_sets]
}

module "load_balancer_listener_map" {
  source                     = "./modules/load_balancer_listener"
  load_balancer_ids          = module.load_balancers.load_balancer_ids
  load_balancer_listener_map = var.load_balancer_listener_map

  depends_on = [module.load_balancers, module.load_balancer_backend_sets]
}
