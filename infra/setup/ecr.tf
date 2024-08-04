############################################
#Create ECR repos for storing Docker images#
#############################################

resource "aws_ecr_repository" "app" {
  name                 = "devops-ud-mark-app"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    # NOTE: enable it in real environment
    scan_on_push = false

  }

}

resource "aws_ecr_repository" "proxy" {
  name                 = "devops-ud-mark-proxy"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    # NOTE: enable it in real environment
    scan_on_push = false

  }

}
