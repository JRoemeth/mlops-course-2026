variable "bucket" {
  description = "The name of the bucket. If omitted, a random unique name is assigned."
  type        = string
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to attach to the resource."
}