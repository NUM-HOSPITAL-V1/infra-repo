data "aws_instance" "control" {
  instance_id = var.control_instance_id
}

data "aws_instance" "worker" {
  instance_id = var.worker_instance_id
}

data "aws_instance" "worker2" {
  instance_id = var.worker2_instance_id
}

data "aws_instance" "worker3" {
  instance_id = var.worker3_instance_id
}
