locals {
  control_ingress_rules = var.manage_ingress_rules ? {
    for rule in var.ingress_rules :
    format(
      "%s-%s-%s-%s",
      rule.protocol,
      tostring(coalesce(try(rule.from_port, null), 0)),
      tostring(coalesce(try(rule.to_port, null), 0)),
      replace(rule.cidr_ipv4, "/", "_")
    ) => rule
  } : {}

  control_egress_rules = {
    for rule in var.egress_rules :
    format(
      "%s-%s-%s-%s",
      rule.protocol,
      tostring(coalesce(try(rule.from_port, null), 0)),
      tostring(coalesce(try(rule.to_port, null), 0)),
      replace(rule.cidr_ipv4, "/", "_")
    ) => rule
  }

  worker_ingress_rules = var.manage_ingress_rules ? {
    for rule in var.worker_ingress_rules :
    format(
      "%s-%s-%s-%s",
      rule.protocol,
      tostring(coalesce(try(rule.from_port, null), 0)),
      tostring(coalesce(try(rule.to_port, null), 0)),
      replace(rule.cidr_ipv4, "/", "_")
    ) => rule
  } : {}

  worker_egress_rules = {
    for rule in var.worker_egress_rules :
    format(
      "%s-%s-%s-%s",
      rule.protocol,
      tostring(coalesce(try(rule.from_port, null), 0)),
      tostring(coalesce(try(rule.to_port, null), 0)),
      replace(rule.cidr_ipv4, "/", "_")
    ) => rule
  }
}

resource "aws_security_group" "control" {
  name        = var.security_group_name
  description = coalesce(var.security_group_description, "Security group for ${var.instance_name}")
  vpc_id      = var.vpc_id

  tags = var.security_group_tags
}

resource "aws_vpc_security_group_ingress_rule" "control" {
  for_each = local.control_ingress_rules

  security_group_id = aws_security_group.control.id
  description       = try(each.value.description, null)
  from_port         = try(each.value.from_port, null)
  to_port           = try(each.value.to_port, null)
  ip_protocol       = each.value.protocol
  cidr_ipv4         = each.value.cidr_ipv4
}

resource "aws_vpc_security_group_egress_rule" "control" {
  for_each = local.control_egress_rules

  security_group_id = aws_security_group.control.id
  description       = try(each.value.description, null)
  from_port         = try(each.value.from_port, null)
  to_port           = try(each.value.to_port, null)
  ip_protocol       = each.value.protocol
  cidr_ipv4         = each.value.cidr_ipv4
}

resource "aws_security_group" "worker" {
  name        = var.worker_security_group_name
  description = coalesce(var.worker_security_group_description, "Security group for ${var.worker_instance_name}")
  vpc_id      = var.vpc_id

  tags = var.worker_security_group_tags
}

resource "aws_vpc_security_group_ingress_rule" "worker" {
  for_each = local.worker_ingress_rules

  security_group_id = aws_security_group.worker.id
  description       = try(each.value.description, null)
  from_port         = try(each.value.from_port, null)
  to_port           = try(each.value.to_port, null)
  ip_protocol       = each.value.protocol
  cidr_ipv4         = each.value.cidr_ipv4
}

resource "aws_vpc_security_group_egress_rule" "worker" {
  for_each = local.worker_egress_rules

  security_group_id = aws_security_group.worker.id
  description       = try(each.value.description, null)
  from_port         = try(each.value.from_port, null)
  to_port           = try(each.value.to_port, null)
  ip_protocol       = each.value.protocol
  cidr_ipv4         = each.value.cidr_ipv4
}
