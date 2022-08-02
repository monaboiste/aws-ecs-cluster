variable "cluster_name" {
  description = "ECS cluster name"
  type        = string
}

variable "tags" {
  description = "(Optional) Additional tags"
  type        = map(string)
  default     = {}
}

variable "region" {
  description = "AWS region to deploy"
  type        = string
}

variable "public_subnet_az" {
  description = "The public subnets' availability zones"
  type        = list(string)
}

variable "private_subnet_az" {
  description = "The private subnets' availability zones"
  type        = list(string)
}

variable "alb_ext_ingress_cidr_blocks" {
  description = "Allows outbound traffic on external ALB for specific IPv4 addresses"
  type        = list(string)
}
