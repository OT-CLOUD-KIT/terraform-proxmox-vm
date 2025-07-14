locals {
  vm_name = "${var.environment}-${var.location}-${var.role}-${var.identifier}-${var.vertical}-"

  all_tags = "${var.environment};${var.location};${var.role};${var.identifier};${var.vertical};${var.extra_tags}"
}



