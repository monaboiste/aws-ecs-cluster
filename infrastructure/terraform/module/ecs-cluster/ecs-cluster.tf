resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.cluster_name
  tags = merge({ Name = var.cluster_name }, var.tags)
}
