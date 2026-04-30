module "network" {
  source = "./network"

  vpc_id = var.vpc_id
}

module "security" {
  source = "./security"

  vpc_id                            = module.network.vpc_id
  instance_name                     = var.instance_name
  security_group_name               = var.security_group_name
  security_group_description        = var.security_group_description
  security_group_tags               = var.security_group_tags
  ingress_rules                     = var.ingress_rules
  manage_ingress_rules              = var.manage_ingress_rules
  egress_rules                      = var.egress_rules
  worker_instance_name              = var.worker_instance_name
  worker_security_group_name        = var.worker_security_group_name
  worker_security_group_description = var.worker_security_group_description
  worker_security_group_tags        = var.worker_security_group_tags
  worker_ingress_rules              = var.worker_ingress_rules
  worker_egress_rules               = var.worker_egress_rules
}

module "compute" {
  source = "./compute"

  control_instance_id = var.control_instance_id
  worker_instance_id  = var.worker_instance_id
  worker2_instance_id = var.worker2_instance_id
  worker3_instance_id = var.worker3_instance_id
}

# Import existing security groups into Terraform state
import {
  to = module.security.aws_security_group.control
  id = "sg-0ee9c796e766b0d4f"
}

import {
  to = module.security.aws_security_group.worker
  id = "sg-0ca594dfe71710a25"
}
