aws_region                 = "eu-north-1"
instance_name              = "Control-plane"
security_group_name        = "control-node-sg"
security_group_description = "Security group for control-node"
security_group_tags        = {}
vpc_id                     = "vpc-0ff7809448ea714b0"

ingress_rules = [
  { from_port = 22,   to_port = 22,   protocol = "tcp", cidr_ipv4 = "0.0.0.0/0" },
  { from_port = 80,   to_port = 80,   protocol = "tcp", cidr_ipv4 = "0.0.0.0/0" },
  { from_port = 443,  to_port = 443,  protocol = "tcp", cidr_ipv4 = "0.0.0.0/0" },
  { from_port = 6443, to_port = 6443, protocol = "tcp", cidr_ipv4 = "0.0.0.0/0" },
  { from_port = 3000, to_port = 3003, protocol = "tcp", cidr_ipv4 = "0.0.0.0/0" },
  { protocol = "-1", cidr_ipv4 = "172.31.0.0/16" }
]

egress_rules = [
  { protocol = "-1", cidr_ipv4 = "0.0.0.0/0" }
]

worker_instance_name              = "Worker-1"
worker_security_group_name        = "worker-node-sg"
worker_security_group_description = "Security group for worker-node"
worker_security_group_tags        = {}

worker_ingress_rules = [
  { from_port = 22,   to_port = 22,   protocol = "tcp", cidr_ipv4 = "0.0.0.0/0" },
  { from_port = 80,   to_port = 80,   protocol = "tcp", cidr_ipv4 = "0.0.0.0/0" },
  { from_port = 443,  to_port = 443,  protocol = "tcp", cidr_ipv4 = "0.0.0.0/0" },
  { from_port = 6443, to_port = 6443, protocol = "tcp", cidr_ipv4 = "0.0.0.0/0" },
  { protocol = "-1", cidr_ipv4 = "172.31.0.0/16" }
]

worker_egress_rules = [
  { protocol = "-1", cidr_ipv4 = "0.0.0.0/0" }
]
