module "apprunner_service" {
  for_each = { for s in var.apprunner_services : s.key => s }

  source            = "./modules/apprunner-service"
  key               = each.value.key
  image_identifier  = each.value.image_identifier
  port              = try(each.value.port, 8000)
  tags              = merge(try(each.value.tags, {}), { environment = var.environment })
}

variable "apprunner_services" {
  description = "A list of App Runner services"
  type        = list(any)
  default     = []
}