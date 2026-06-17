module "ecr_repository" {
  for_each = { for r in var.ecr_repositories : r.key => r }
  
  source = "./modules/ecr-repository"
  key    = each.value.key
  image_tag_mutability = try(each.value.image_tag_mutability, "MUTABLE")
  image_scanning_configuration = try(each.value.image_scanning_configuration, [])
  tags = merge(try(each.value.tags, {}), { environment = var.environment })
}