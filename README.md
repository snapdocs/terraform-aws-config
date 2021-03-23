Enable AWS Config role, recorder and start the recorder

example usage:

```
module "config-us-west-1" {
  source  = "snapdocs/config/aws"
  version = "0.0.1"  providers = {
    aws = aws.usw1
  }
  config_recorder_role_arn = "arn:aws:iam::234923752314:role/aws-config"
  include_global_resource_types = true
}
```
