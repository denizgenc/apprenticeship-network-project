# We need to store the following secrets:
# 1. Database password
# 2. The KMS key used to encrypt the remote state

#resource "aws_kms_key" "remote_state_key" {
#  description             = "A key to decrypt the remote state in ${aws_s3_bucket.backend_bucket.id}"
#  deletion_window_in_days = 7
#  tags {
#    Name = "${var.name_prefix}-remote-state-key"
#  }
#}

# I'm creating the remote state key manually because I can't figure out how to create it in
# Terraform and then reference that in the backend configuration

resource "random_password" "db_password" {
  length = 64
}

resource "aws_ssm_parameter" "db_password" {
  name        = "${var.name_prefix}-db-password"
  description = "The parameter description"
  type        = "SecureString"
  value       = random_password.db_password.result
}