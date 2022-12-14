/* data "aws_iam_role" "role" {
  name   = "liz-role"
} */
data "aws_iam_instance_profile" "profile" {
  name = "liz_profile"
}

resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  count = length(var.subnet) * var.instances_per_subnet
  iam_instance_profile = data.aws_iam_instance_profile.profile.name
  subnet_id      = element(var.subnet, count.index)
  key_name = var.keyname
  security_groups =  [var.security_groups]
  tags = merge(
    var.tags,
    {
      Name = "instance_${var.enviroment}_${count.index+1}_${terraform.workspace}"
    },
  )
  volume_tags = merge(
    var.volume_tags,
    {
      Name = "instance_${var.enviroment}_${count.index+1}_${terraform.workspace}"
    },
  )
}