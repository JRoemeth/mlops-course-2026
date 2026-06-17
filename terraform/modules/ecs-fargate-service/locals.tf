locals {
  cluster_name = "ecs-${var.key}-cluster"
  task_family  = "ecs-${var.key}-task"
  service_name = "ecs-${var.key}-service"
}