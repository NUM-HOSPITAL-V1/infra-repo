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

# Import existing security groups into Terraform state
import {
  to = module.security.aws_security_group.control
  id = "sg-0a7805255b846aec8"
}

import {
  to = module.security.aws_security_group.worker
  id = "sg-04d4185c11e869327"
}

# Import control SG ingress rules
import {
  to = module.security.aws_vpc_security_group_ingress_rule.control["tcp-22-22-0.0.0.0_0"]
  id = "sgr-0f55a71dad58cc0ff"
}

import {
  to = module.security.aws_vpc_security_group_ingress_rule.control["tcp-80-80-0.0.0.0_0"]
  id = "sgr-0202f3e645fb06919"
}

import {
  to = module.security.aws_vpc_security_group_ingress_rule.control["tcp-443-443-0.0.0.0_0"]
  id = "sgr-07a92f17c57465f0e"
}

import {
  to = module.security.aws_vpc_security_group_ingress_rule.control["tcp-6443-6443-0.0.0.0_0"]
  id = "sgr-06181ab6552ca0d6a"
}

import {
  to = module.security.aws_vpc_security_group_ingress_rule.control["tcp-3000-3003-0.0.0.0_0"]
  id = "sgr-0c3506074ebb842b1"
}

import {
  to = module.security.aws_vpc_security_group_ingress_rule.control["-1-0-0-172.31.0.0_16"]
  id = "sgr-0a9b55bade1d7112e"
}

# Import control SG egress rule
import {
  to = module.security.aws_vpc_security_group_egress_rule.control["-1-0-0-0.0.0.0_0"]
  id = "sgr-0b0185b5c69930201"
}

# Import worker SG ingress rules
import {
  to = module.security.aws_vpc_security_group_ingress_rule.worker["tcp-22-22-0.0.0.0_0"]
  id = "sgr-024a75127b5f2f989"
}

import {
  to = module.security.aws_vpc_security_group_ingress_rule.worker["tcp-80-80-0.0.0.0_0"]
  id = "sgr-0405cea982f019c0b"
}

import {
  to = module.security.aws_vpc_security_group_ingress_rule.worker["tcp-443-443-0.0.0.0_0"]
  id = "sgr-0ab19155060499950"
}

import {
  to = module.security.aws_vpc_security_group_ingress_rule.worker["tcp-6443-6443-0.0.0.0_0"]
  id = "sgr-00a4193c0399cf04b"
}

import {
  to = module.security.aws_vpc_security_group_ingress_rule.worker["-1-0-0-172.31.0.0_16"]
  id = "sgr-0feeefda91d05591d"
}

# Import worker SG egress rule
import {
  to = module.security.aws_vpc_security_group_egress_rule.worker["-1-0-0-0.0.0.0_0"]
  id = "sgr-07c65a2031b4c42c7"
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
