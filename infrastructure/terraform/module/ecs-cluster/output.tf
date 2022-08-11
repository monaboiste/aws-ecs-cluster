output "cluster_name" {
  value = aws_ecs_cluster.ecs_cluster.name
}

output "cluster_id" {
  value = aws_ecs_cluster.ecs_cluster.id
}

output "cluster_arn" {
  value = aws_ecs_cluster.ecs_cluster.arn
}

output "alb_ext_dns_name" {
  value = aws_alb.alb_ext.dns_name
}

#output "alb_int_dns_name" {
#  value = aws_alb.alb_int.dns_name
#}

output "alb_ext_default_security_group_ids" {
  value = aws_alb.alb_ext.security_groups
}

#output "alb_int_default_security_group_ids" {
#  value = aws_alb.alb_int.security_groups
#}
