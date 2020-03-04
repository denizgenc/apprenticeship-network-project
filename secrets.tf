# We need to store the following secrets in SSM:
# 1. Database password
# 2. The KMS key used to encrypt the remote state

resource "aws_kms_key" "remote_state_key" {
  description             = "A key to decrypt the remote state in ${aws_s3_bucket.backend_bucket.id}"
  deletion_window_in_days = 7
  tags {
    Name = "${var.name_prefix}-remote-state-key"
  }
}