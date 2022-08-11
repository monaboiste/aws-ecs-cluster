## Internal load balancer
#resource "aws_alb" "alb_int" {
#  name               = "${var.cluster_name}-alb-int"
#  internal           = true
#  load_balancer_type = "application"
#  security_groups    = [aws_security_group.default_alb_int_sg.id]
#
#  subnets = data.aws_subnets.private_subnets.ids
#
#  tags = merge({ Name = "${var.cluster_name}-alb-int" }, var.tags)
#}
#
#resource "aws_alb_listener" "alb_int_listener_http" {
#  load_balancer_arn = aws_alb.alb_int.arn
#  port              = 80
#  protocol          = "HTTP"
#
#  default_action {
#    type = "fixed-response"
#
#    fixed_response {
#      content_type = "text/plain"
#      message_body = "Unable to resolve request to the service"
#      status_code  = "404"
#    }
#  }
#
#  tags = merge({ Name = "${var.cluster_name}-alb-int-listener" }, var.tags)
#}
#
## Security groups
#resource "aws_security_group" "default_alb_int_sg" {
#  name        = "${var.cluster_name}-alb-int-sg"
#  description = "Default SG for ${var.cluster_name} for internal ALB"
#  vpc_id      = data.aws_vpc.vpc.id
#  tags        = merge({ Name = "${var.cluster_name}-alb-int-sg" }, var.tags)
#}
#
#resource "aws_security_group_rule" "ingress_alb_int_sgr_http" {
#  type              = "ingress"
#  protocol          = "tcp"
#  from_port         = 80
#  to_port           = 80
#  security_group_id = aws_security_group.default_alb_int_sg.id
#  cidr_blocks       = [data.aws_vpc.vpc.cidr_block]
#}
#
#resource "aws_security_group_rule" "egress_alb_int_sgr_any" {
#  type              = "egress"
#  protocol          = "-1"
#  from_port         = 0
#  to_port           = 0
#  security_group_id = aws_security_group.default_alb_int_sg.id
#  cidr_blocks       = ["0.0.0.0/0"]
#}