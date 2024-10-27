output "eks_node_sg_id" {
  value = aws_security_group.eks_node_sg.id
}

output "lb_sg_id" {
  value = aws_security_group.lb_sg.id
}
