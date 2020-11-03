# The MIT License (MIT)
# Copyright (c) 2014-2020 Avant, Sean Lingren

resource "aws_acm_certificate" "acm" {
  count             = var.alb_certificate_arn == "" ? 1 : 0
  domain_name       = local.plain_domain
  validation_method = "DNS"

  tags = merge(
    { "Name" = var.name_prefix },
    var.tags,
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "dns_acm_validation" {
  count   = var.alb_certificate_arn == "" ? 1 : 0
  name    = aws_acm_certificate.acm[0].domain_validation_options.*.resource_record_name[0]
  type    = aws_acm_certificate.acm[0].domain_validation_options.*.resource_record_type[0]
  zone_id = var.zone_id
  records = [aws_acm_certificate.acm[0].domain_validation_options.*.resource_record_value[0]]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "acm_validation" {
  count                   = var.alb_certificate_arn == "" ? 1 : 0
  certificate_arn         = aws_acm_certificate.acm[0].arn
  validation_record_fqdns = [aws_route53_record.dns_acm_validation[0].fqdn]
}
