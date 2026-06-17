variable "key" {
  description = "The key for the ECR repository"
  type        = string
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository"
  type        = string
  default     = "MUTABLE"
}

variable "image_scanning_configuration" {
  description = "Image scanning configuration"
  type        = any
  default     = []
}

variable "tags" {
  description = "Tags for the repository"
  type        = map(string)
  default     = {}
}