module "ecs_cluster" {
  source = "../../module/ecs-cluster"

  cluster_name                = local.cluster_name
  alb_ext_ingress_cidr_blocks = local.alb_ext_ingress_cidr_blocks
  region                      = local.region
  public_subnet_az            = local.public_subnet_az
  private_subnet_az           = local.private_subnet_az
  tags                        = local.tags
}
