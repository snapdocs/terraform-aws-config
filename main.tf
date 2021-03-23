
resource "aws_config_configuration_recorder" "config" {
  name     = "config-recorder"
  role_arn = var.config_recorder_role_arn

  recording_group {
    all_supported                 = true
    include_global_resource_types = var.include_global_resource_types
  }
}

resource "aws_config_delivery_channel" "config" {
  name           = "config-to-s3"
  s3_bucket_name = var.bucket_name
  s3_key_prefix  = var.bucket_key_prefix

  snapshot_delivery_properties {
    delivery_frequency = var.snapshot_frequency
  }
  depends_on = [aws_config_configuration_recorder.config]
}

resource "aws_config_configuration_recorder_status" "config" {
  name       = aws_config_configuration_recorder.config.name
  is_enabled = true
  depends_on = [aws_config_delivery_channel.config]
}

resource "aws_config_configuration_aggregator" "organization" {
  count = var.organization_config_master == true ? 1 : 0
  name  = "organization-wide-config"

  organization_aggregation_source {
    all_regions = true
    role_arn    = var.organization_role_arn
  }
  tags = var.tags
}
