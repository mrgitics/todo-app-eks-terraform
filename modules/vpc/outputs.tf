output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_ids" {
  value = aws_subnet.private_subnet[*].id
}
output "cidr_block" {
  value = aws_vpc.vpc.cidr_block
}
output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private_subnet[*].id
}

output "public_subnet_ids" {
  description = "ID of the public subnet"
  value       = aws_subnet.public_subnet[*].id
}
output "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  value       = [for subnet in aws_subnet.private_subnet : subnet.cidr_block]
}
