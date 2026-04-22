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

  ami_id                = var.ami_id
  instance_type         = var.instance_type
  key_name              = var.key_name
  instance_name         = var.instance_name
  worker_ami_id         = var.worker_ami_id
  worker2_ami_id        = var.worker2_ami_id
  worker3_ami_id        = var.worker3_ami_id
  worker_instance_type  = var.worker_instance_type
  worker_key_name       = var.worker_key_name
  worker_instance_name  = var.worker_instance_name
  worker2_instance_name = var.worker2_instance_name
  worker3_instance_name = var.worker3_instance_name
  control_sg_id         = module.security.control_sg_id
  worker_sg_id          = module.security.worker_sg_id
}

# Import existing EC2 instances into Terraform state
import {
  to = module.compute.aws_instance.control
  id = "i-039db39acf8d9c072"
}

import {
  to = module.compute.aws_instance.worker
  id = "i-0fff6fd0298478406"
}

import {
  to = module.compute.aws_instance.worker2
  id = "i-01d456ea1fff60155"
}

import {
  to = module.compute.aws_instance.worker3
  id = "i-0f4c17ffe235b8fbe"
}
