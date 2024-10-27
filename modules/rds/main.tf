resource "aws_db_instance" "database" {
  allocated_storage    = var.allocated_storage
  engine               = "postgres"
  engine_version       = "16.4"
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  publicly_accessible  = var.publicly_accessible
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  skip_final_snapshot  = true
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name  # Corrected argument
  parameter_group_name    = aws_db_parameter_group.postgresql_parameters.name
}

# RDS Subnet Group with Private Subnets
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.private_subnet_ids  # Make sure this is private subnets only

  tags = {
    Name = "${var.db_name}-subnet-group"
  }
}

resource "aws_security_group" "db_sg" {
  name_prefix = "${var.db_name}-db-sg-"
  vpc_id      = var.vpc_id  # Ensure this is the EKS VPC ID

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Use the passed variable
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_db_parameter_group" "postgresql_parameters" {
  name        = "custom-pg-ssl"
  family      = "postgres16"  # Use the correct family based on your RDS engine version
  description = "Custom PostgreSQL parameter group with SSL adjustments"

  parameter {
    name  = "rds.force_ssl"
    value = "1"  # Set to "0" to disable SSL, but not recommended for production
  }
}
