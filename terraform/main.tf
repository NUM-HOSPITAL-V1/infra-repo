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

# Control SG ingress rules
import {
  to = module.security.aws_vpc_security_group_ingress_rule.control["tcp-22-22-0.0.0.0_0"]
  id = "sgr-0f1a661e1e94e80a1"
}
import {
  to = module.security.aws_vpc_security_group_ingress_rule.control["tcp-80-80-0.0.0.0_0"]
  id = "sgr-03d7d54d67c28bd86"
}
import {
  to = module.security.aws_vpc_security_group_ingress_rule.control["tcp-443-443-0.0.0.0_0"]
  id = "sgr-0b84c7c82424883bb"
}
import {
  to = module.security.aws_vpc_security_group_ingress_rule.control["tcp-6443-6443-0.0.0.0_0"]
  id = "sgr-0a5cc4f9211b06a48"
}
import {
  to = module.security.aws_vpc_security_group_ingress_rule.control["tcp-3000-3003-0.0.0.0_0"]
  id = "sgr-08c72d5628eb68822"
}
import {
  to = module.security.aws_vpc_security_group_ingress_rule.control["-1-0-0-172.31.0.0_16"]
  id = "sgr-02e86867a25d081a4"
}

# Control SG egress rules
import {
  to = module.security.aws_vpc_security_group_egress_rule.control["-1-0-0-0.0.0.0_0"]
  id = "sgr-0602e9dc9b833e3cb"
}

# Worker SG ingress rules
import {
  to = module.security.aws_vpc_security_group_ingress_rule.worker["tcp-22-22-0.0.0.0_0"]
  id = "sgr-02e190eb8b700a3ce"
}
import {
  to = module.security.aws_vpc_security_group_ingress_rule.worker["tcp-80-80-0.0.0.0_0"]
  id = "sgr-0047ab959602648e9"
}
import {
  to = module.security.aws_vpc_security_group_ingress_rule.worker["tcp-443-443-0.0.0.0_0"]
  id = "sgr-0d669c52babfbf5f2"
}
import {
  to = module.security.aws_vpc_security_group_ingress_rule.worker["tcp-6443-6443-0.0.0.0_0"]
  id = "sgr-0cf68995dc7f3f1da"
}
import {
  to = module.security.aws_vpc_security_group_ingress_rule.worker["-1-0-0-172.31.0.0_16"]
  id = "sgr-0dbe8911add65e170"
}

# Worker SG egress rules
import {
  to = module.security.aws_vpc_security_group_egress_rule.worker["-1-0-0-0.0.0.0_0"]
  id = "sgr-0e5ee8c281994acfc"
}

# EC2 instances
import {
  to = module.compute.aws_instance.control
  id = "i-016e2b71f6bbb50b8"
}
import {
  to = module.compute.aws_instance.worker
  id = "i-0e59445bec89b5653"
}
import {
  to = module.compute.aws_instance.worker2
  id = "i-0a7943eb33b0717ba"
}
import {
  to = module.compute.aws_instance.worker3
  id = "i-0c563683c57f69ae6"
}
