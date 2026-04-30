variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

# --- Instance IDs (user provides after manual creation) ---

variable "control_instance_id" {
  description = "Control node EC2 instance ID (e.g. i-0abc123)"
  type        = string
}

variable "worker_instance_id" {
  description = "Worker 1 EC2 instance ID"
  type        = string
}

variable "worker2_instance_id" {
  description = "Worker 2 EC2 instance ID"
  type        = string
}

variable "worker3_instance_id" {
  description = "Worker 3 EC2 instance ID"
  type        = string
}

# --- Security groups ---

variable "security_group_name" {
  type    = string
  default = "control-node-sg"
}

variable "security_group_description" {
  type    = string
  default = null
}

variable "security_group_tags" {
  type    = map(string)
  default = {}
}

variable "ingress_rules" {
  type = list(object({
    description = optional(string)
    from_port   = optional(number)
    to_port     = optional(number)
    protocol    = string
    cidr_ipv4   = string
  }))
  default = []
}

variable "manage_ingress_rules" {
  type    = bool
  default = true
}

variable "egress_rules" {
  type = list(object({
    description = optional(string)
    from_port   = optional(number)
    to_port     = optional(number)
    protocol    = string
    cidr_ipv4   = string
  }))
  default = [{ protocol = "-1", cidr_ipv4 = "0.0.0.0/0" }]
}

variable "worker_security_group_name" {
  type    = string
  default = "worker-node-sg"
}

variable "worker_security_group_description" {
  type    = string
  default = null
}

variable "worker_security_group_tags" {
  type    = map(string)
  default = {}
}

variable "worker_ingress_rules" {
  type = list(object({
    description = optional(string)
    from_port   = optional(number)
    to_port     = optional(number)
    protocol    = string
    cidr_ipv4   = string
  }))
  default = []
}

variable "worker_egress_rules" {
  type = list(object({
    description = optional(string)
    from_port   = optional(number)
    to_port     = optional(number)
    protocol    = string
    cidr_ipv4   = string
  }))
  default = [{ protocol = "-1", cidr_ipv4 = "0.0.0.0/0" }]
}

variable "instance_name" {
  type    = string
  default = "control-node"
}

variable "worker_instance_name" {
  type    = string
  default = "worker-node"
}
