variable "key" {
  description = "The key for the service"
  type        = string
}

variable "container" {
  description = "Container configuration"
  type = object({
    name  = string
    image = string
    port  = number
    cpu   = number
    memory = number
  })
}

variable "desired_count" {
  description = "Number of tasks to run"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}