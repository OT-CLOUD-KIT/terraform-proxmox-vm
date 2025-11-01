locals {  
  vm_name = "${var.environment}-${var.location}-${var.role}-${var.identifier}-${var.vertical}"
  tags = "${var.environment};${var.location};${var.role};${var.identifier};${var.vertical};${var.owner};${var.availability};${var.lifetime};${var.operating_system};${var.extra_tags}"
  effective_target_node = var.location == "ashwathama" ? "op-srv-01" : var.location
  effective_storage     = var.location == "ashwathama" ? "local" : var.storage
}

