variable "key" {
  description = "The key for the service"
  type        = string
}

variable "image_identifier" {
  description = "The ECR image URI"
  type        = string
}

variable "port" {
  description = "The port the service listens on"
  type        = number
  default     = 8000
}

variable "tags" {
  description = "Tags for the service"
  type        = map(string)
  default     = {}
}