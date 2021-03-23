
variable "bucket_name" {
  description = "AWS Config Destination bucket"
  type        = string
  default     = ""
}

variable "bucket_key_prefix" {
  description = "AWS Config Destination bucket folder prefix"
  type        = string
  default     = "Config"
}

variable "include_global_resource_types" {
  description = "include global resource types"
  type        = bool
  default     = false
}

variable "config_recorder_role_arn" {
  description = "AWS Config recorder role ARN"
  type        = string
  default     = ""
}

variable "snapshot_frequency" {
  description = "AWS Config snapshot frequency"
  type        = string
  default     = "Three_Hours"
}

variable "organization_config_master" {
  description = "AWS Config organization master account"
  type        = bool
  default     = false
}

variable "organization_role_arn" {
  description = "AWS Config organization role arn"
  type        = string
  default     = ""
}

variable "tags" { default = {} } 
