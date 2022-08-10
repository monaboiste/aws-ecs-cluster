# External load balancer
resource "aws_alb" "alb_ext" {
  name               = "${var.cluster_name}-alb-ext"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.default_ext_alb_sg.id]

  subnets = data.aws_subnets.public_subnets.ids

  tags = merge({ Name = "${var.cluster_name}-alb-ext" }, var.tags)
}

resource "aws_alb_listener" "ext_alb_listener_http" {
  load_balancer_arn = aws_alb.alb_ext.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Unable to resolve request to the service"
      status_code  = "404"
    }
  }

  tags = merge({ Name = "${var.cluster_name}-alb-ext-listener" }, var.tags)
}

# Security groups
resource "aws_security_group" "default_ext_alb_sg" {
  name        = "${var.cluster_name}-alb-ext-sg"
  description = "Default SG for ${var.cluster_name} for internet facing ALB"
  vpc_id      = data.aws_vpc.vpc.id
  tags        = merge({ Name = "${var.cluster_name}-alb-ext-sg" }, var.tags)
}

resource "aws_security_group_rule" "ingress_ext_alb_sgr_http" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  security_group_id = aws_security_group.default_ext_alb_sg.id
  cidr_blocks       = var.alb_ext_ingress_cidr_blocks
}

resource "aws_security_group_rule" "egress_ext_alb_sgr_any" {
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  security_group_id = aws_security_group.default_ext_alb_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}