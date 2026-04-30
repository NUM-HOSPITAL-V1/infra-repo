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

import {
  to = module.security.aws_vpc_security_group_ingress_rule.control["tcp-22-22-0.0.0.0_0"]
  id = "sgr-034c4c77ab11a4fbc"
}

import {
  to = module.security.aws_vpc_security_group_egress_rule.control["-1-0-0-0.0.0.0_0"]
  id = "sgr-01b44f9ce94164db2"
}

import {
  to = module.security.aws_vpc_security_group_ingress_rule.worker["tcp-22-22-0.0.0.0_0"]
  id = "sgr-02c8c63beb239d20e"
}

import {
  to = module.security.aws_vpc_security_group_egress_rule.worker["-1-0-0-0.0.0.0_0"]
  id = "sgr-01f12fdcba40e3044"
}
