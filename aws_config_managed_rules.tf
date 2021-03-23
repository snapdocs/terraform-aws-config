# https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html
# https://www.terraform.io/docs/providers/aws/r/config_organization_managed_rule.html

# https://docs.aws.amazon.com/config/latest/developerguide/cloudtrail-enabled.html
resource "aws_config_organization_managed_rule" "cloudtrail-enabled" {
  count           = var.organization_config_master == true ? 1 : 0
  name            = "cloudtrail-enabled"
  rule_identifier = "CLOUD_TRAIL_ENABLED"
}

# https://docs.aws.amazon.com/config/latest/developerguide/multi-region-cloud-trail-enabled.html
resource "aws_config_organization_managed_rule" "multi-cloudtrail" {
  count           = var.organization_config_master == true ? 1 : 0
  name            = "multi-region-cloudtrail-enabled"
  rule_identifier = "MULTI_REGION_CLOUD_TRAIL_ENABLED"
}

# https://docs.aws.amazon.com/config/latest/developerguide/cloudtrail-s3-dataevents-enabled.html
resource "aws_config_organization_managed_rule" "s3-cloudtrail" {
  count           = var.organization_config_master == true ? 1 : 0
  name            = "cloudtrail-logging-to-s3-enabled"
  rule_identifier = "CLOUDTRAIL_S3_DATAEVENTS_ENABLED"
}

# https://docs.aws.amazon.com/config/latest/developerguide/rds-storage-encrypted.html
resource "aws_config_organization_managed_rule" "rds-storage-encrypted" {
  count           = var.organization_config_master == true ? 1 : 0
  name            = "rds-storage-encrypted"
  rule_identifier = "RDS_STORAGE_ENCRYPTED"
}

# https://docs.aws.amazon.com/config/latest/developerguide/acm-certificate-expiration-check.html
resource "aws_config_organization_managed_rule" "acm-expiration-check" {
  count           = var.organization_config_master == true ? 1 : 0
  name             = "acm-expiration-check"
  rule_identifier  = "ACM_CERTIFICATE_EXPIRATION_CHECK"
  input_parameters = "{ \"daysToExpiration\": \"14\" }"
}

# https://docs.aws.amazon.com/config/latest/developerguide/guardduty-enabled-centralized.html
resource "aws_config_organization_managed_rule" "guardduty-centralized" {
  count           = var.organization_config_master == true ? 1 : 0
  name             = "guard-duty-centralized"
  rule_identifier  = "GUARDDUTY_ENABLED_CENTRALIZED"
  input_parameters = "{ \"CentralMonitoringAccount\": \"764270331768\" }"
}

# https://docs.aws.amazon.com/config/latest/developerguide/mfa-enabled-for-iam-console-access.html
resource "aws_config_organization_managed_rule" "mfa-for-console" {
  count           = var.organization_config_master == true ? 1 : 0
  name            = "mfa-enabled-for-console-access"
  rule_identifier = "MFA_ENABLED_FOR_IAM_CONSOLE_ACCESS"
}

# https://docs.aws.amazon.com/config/latest/developerguide/root-account-mfa-enabled.html
resource "aws_config_organization_managed_rule" "root-mfa" {
  count           = var.organization_config_master == true ? 1 : 0
  name            = "mfa-enabled-for-root-user"
  rule_identifier = "ROOT_ACCOUNT_MFA_ENABLED"
}

# The following rule is aspirational but ideal state to work towards
# is that only what our customers or employees need is accessible from
# the entire internet.
# TCP 80 - for redirecting to 443
# TCP 443 - for https/TLS. customer facing apps, VPN interface, etc.
# UDP 1194 - openVPN connectivity

# https://docs.aws.amazon.com/config/latest/developerguide/vpc-sg-open-only-to-authorized-ports.html
resource "aws_config_organization_managed_rule" "sg-open-all" {
  count            = var.organization_config_master == true ? 1 : 0
  name             = "securitygroup-ports-open-to-all"
  rule_identifier  = "VPC_SG_OPEN_ONLY_TO_AUTHORIZED_PORTS"
  input_parameters = "{ \"authorizedTcpPorts\": \"80,443\",\"authorizedUdpPorts\": \"1194\"}"
}
