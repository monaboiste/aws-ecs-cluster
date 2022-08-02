locals {
  region                      = "eu-west-1"
  cluster_name                = "tsrs-${local.region}-cluster"
  alb_ext_ingress_cidr_blocks = ["0.0.0.0/0"]
  public_subnet_az            = ["${local.region}a", "${local.region}b"]
  private_subnet_az           = ["${local.region}a", "${local.region}b"]

  tags = {
    "Automation" : "git@github.com:monaboiste/aws-ecs-cluster.git infrastructure/terraform/${local.region}/${local.cluster_name}"
  }
}
