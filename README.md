## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | <= 4.32.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.32.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.7.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.0 |

## Providers

| Name |
|------|
| <a name="aws"></a> 
| <a name="helm"></a>
| <a name="kubernetes"></a>

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | ./modules/eks | n/a |
| <a name="module_helm"></a> [helm](#module\_helm) | ./modules/helm | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |
| <a name="module_security"></a> [security](#module\_security) | ./modules/security | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | image to create instance | `string` | n/a | yes |
| <a name="input_enviroment"></a> [enviroment](#input\_enviroment) | n/a | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | instance type | `string` | n/a | yes |
| <a name="input_instances_per_subnet"></a> [instances\_per\_subnet](#input\_instances\_per\_subnet) | instances per subnet | `number` | n/a | yes |
| <a name="input_keyname"></a> [keyname](#input\_keyname) | key for the aws | `string` | n/a | yes |
| <a name="input_public_subnets_per_vpc"></a> [public\_subnets\_per\_vpc](#input\_public\_subnets\_per\_vpc) | public subnets per vpc | `number` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to set on the computed variables. | `map(string)` | n/a | yes |
| <a name="input_volume_tags"></a> [volume\_tags](#input\_volume\_tags) | Tags to set on the instance variables. | `map(string)` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for VPC | `string` | n/a | yes |
| <a name="input_vpc_enable_nat_gateway"></a> [vpc\_enable\_nat\_gateway](#input\_vpc\_enable\_nat\_gateway) | Enable NAT gateway for VPC | `bool` | n/a | yes |

## Outputs

No outputs.
