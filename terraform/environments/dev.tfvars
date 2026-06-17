environment = "dev"
aws_region = "eu-west-1"
s3_buckets = [
  {
    key = "mlops-course-ehb-datastore-jr-justus"
    tags = {}
  }
]

ecr_repositories = [
  {
    key = "mlops-course-app"
    image_tag_mutability = "MUTABLE"
    image_scanning_configuration = [
      {
        scan_on_push = true
      }
    ]
    tags = {}
  }
]

apprunner_services = [
  {
    key               = "app"
    image_identifier  = "717958589002.dkr.ecr.eu-west-1.amazonaws.com/ecr-mlops-course-app:latest"
    port              = 8000
    tags              = {}
  }
]

ecs_services = [
  {
    key = "mlops-app"
    container = {
      name   = "app"
      image  = "717958589002.dkr.ecr.eu-west-1.amazonaws.com/ecr-mlops-course-app:latest"
      port   = 8000
      cpu    = 256
      memory = 512
    }
    desired_count = 1
    tags          = {}
  }
]