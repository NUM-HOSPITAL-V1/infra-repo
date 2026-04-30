output "control_instance_id" {
  value = data.aws_instance.control.id
}

output "control_instance_public_ip" {
  value = data.aws_instance.control.public_ip
}

output "control_instance_public_dns" {
  value = data.aws_instance.control.public_dns
}

output "worker_instance_id" {
  value = data.aws_instance.worker.id
}

output "worker_instance_public_ip" {
  value = data.aws_instance.worker.public_ip
}

output "worker2_instance_id" {
  value = data.aws_instance.worker2.id
}

output "worker2_instance_public_ip" {
  value = data.aws_instance.worker2.public_ip
}

output "worker3_instance_id" {
  value = data.aws_instance.worker3.id
}

output "worker3_instance_public_ip" {
  value = data.aws_instance.worker3.public_ip
}
