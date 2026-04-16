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

moved {
  from = aws_instance.control
  to   = module.compute.aws_instance.control
}

moved {
  from = aws_instance.worker
  to   = module.compute.aws_instance.worker
}

moved {
  from = aws_instance.worker2
  to   = module.compute.aws_instance.worker2
}

moved {
  from = aws_instance.worker3
  to   = module.compute.aws_instance.worker3
}

moved {
  from = aws_security_group.control
  to   = module.security.aws_security_group.control
}

moved {
  from = aws_security_group.worker
  to   = module.security.aws_security_group.worker
}

moved {
  from = aws_vpc_security_group_ingress_rule.control
  to   = module.security.aws_vpc_security_group_ingress_rule.control
}

moved {
  from = module.security.aws_vpc_security_group_ingress_rule.control["0"]
  to   = module.security.aws_vpc_security_group_ingress_rule.control["tcp-22-22-0.0.0.0_0"]
}

moved {
  from = module.security.aws_vpc_security_group_ingress_rule.control["1"]
  to   = module.security.aws_vpc_security_group_ingress_rule.control["tcp-80-80-0.0.0.0_0"]
}

moved {
  from = module.security.aws_vpc_security_group_ingress_rule.control["2"]
  to   = module.security.aws_vpc_security_group_ingress_rule.control["tcp-443-443-0.0.0.0_0"]
}

moved {
  from = module.security.aws_vpc_security_group_ingress_rule.control["3"]
  to   = module.security.aws_vpc_security_group_ingress_rule.control["tcp-6443-6443-0.0.0.0_0"]
}

moved {
  from = module.security.aws_vpc_security_group_ingress_rule.control["4"]
  to   = module.security.aws_vpc_security_group_ingress_rule.control["tcp-3000-3003-0.0.0.0_0"]
}

moved {
  from = aws_vpc_security_group_egress_rule.control
  to   = module.security.aws_vpc_security_group_egress_rule.control
}

moved {
  from = module.security.aws_vpc_security_group_egress_rule.control["0"]
  to   = module.security.aws_vpc_security_group_egress_rule.control["-1-0-0-0.0.0.0_0"]
}

moved {
  from = aws_vpc_security_group_ingress_rule.worker
  to   = module.security.aws_vpc_security_group_ingress_rule.worker
}

moved {
  from = module.security.aws_vpc_security_group_ingress_rule.worker["0"]
  to   = module.security.aws_vpc_security_group_ingress_rule.worker["tcp-22-22-0.0.0.0_0"]
}

moved {
  from = module.security.aws_vpc_security_group_ingress_rule.worker["1"]
  to   = module.security.aws_vpc_security_group_ingress_rule.worker["tcp-80-80-0.0.0.0_0"]
}

moved {
  from = module.security.aws_vpc_security_group_ingress_rule.worker["2"]
  to   = module.security.aws_vpc_security_group_ingress_rule.worker["tcp-443-443-0.0.0.0_0"]
}

moved {
  from = module.security.aws_vpc_security_group_ingress_rule.worker["3"]
  to   = module.security.aws_vpc_security_group_ingress_rule.worker["tcp-6443-6443-0.0.0.0_0"]
}

moved {
  from = aws_vpc_security_group_egress_rule.worker
  to   = module.security.aws_vpc_security_group_egress_rule.worker
}

moved {
  from = module.security.aws_vpc_security_group_egress_rule.worker["0"]
  to   = module.security.aws_vpc_security_group_egress_rule.worker["-1-0-0-0.0.0.0_0"]
}

import {
  to = module.security.aws_security_group.control
  id = "sg-07cfa872554229632"
}

import {
  to = module.security.aws_security_group.worker
  id = "sg-0d7ebce78163822e9"
}
