aws_region                 = "us-east-1"           # TODO: confirm with `aws configure get region`
ami_id                     = "ami-0ec10929233384c7f"
instance_type              = "t3.micro"
key_name                   = "Node-ubuntu"
instance_name              = "Control-plane"
security_group_name        = "control-node-sg"      # TODO: update after SG check
security_group_description = "Security group for control-node"
security_group_tags        = {}
vpc_id                     = "vpc-00b1ae3e035f2119c"

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

worker_ami_id                     = "ami-0ec10929233384c7f"
worker2_ami_id                    = "ami-0ec10929233384c7f"
worker3_ami_id                    = "ami-0ec10929233384c7f"
worker_instance_type              = "t3.micro"
worker_key_name                   = "Node-ubuntu"
worker_instance_name              = "Worker-1"
worker2_instance_name             = "worker-2"
worker3_instance_name             = "worker-3"
worker_security_group_name        = "worker-node-sg"   # TODO: update after SG check
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
