output "db_endpoint" {
  description = "The RDS database endpoint"
  value       = aws_db_instance.database.address
}

output "db_sg_id" {
  description = "The ID of the RDS security group"
  value       = aws_security_group.db_sg.id
}

