output "config_recorder_id" {
  value = aws_config_configuration_recorder.config.id
}

output "config_delivery_channel_id" {
  value = aws_config_delivery_channel.config.id
}
