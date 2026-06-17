module "ecs_service" {
  for_each = { for s in var.ecs_services : s.key => s }

  source        = "./modules/ecs-fargate-service"
  key           = each.value.key
  container     = each.value.container
  desired_count = try(each.value.desired_count, 1)
  tags          = merge(try(each.value.tags, {}), { environment = var.environment })
}