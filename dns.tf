data "terraform_remote_state" "dns_zone" {
    backend = "s3"
    config {
        bucket = "${var.dns_state_bucket}" # This is in the dns_settings.tfvars file, hidden by .gitignore
        key = "dns/${var.dns_zone_fqdn}.dns.tfstate"
        region = "${var.dns-_state_region}"
        encrypt = true
    }
}

resource "aws_route53_record" "www" {
    zone_id = "${data.terraform_remote_state.dns_zone.zone_id}"
    name = "${var.sub_domain}"
    type = "A"
    type = "A"
    ttl = "300"
    records = ["${aws_eip.eip_1.public_ip}"]
}
