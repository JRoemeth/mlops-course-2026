resource "aws_s3_bucket" "my_bucket" {
  bucket = "mlops-course-2026-jr-justus"
  tags = {
    Environment = "dev"
  }
}