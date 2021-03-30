resource "aws_launch_configuration" "asg-lc-ec2" {
  name_prefix                 = var.lc_name
  image_id                    = var.image_id
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address

  root_block_device {
    volume_size = var.root_block_device_volume_size
    volume_type = var.root_block_device_volume_type
    encrypted = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg-lc-ec2" {
  availability_zones   = ["us-east-1a"]
  name                 = var.asg_name
  desired_capacity     = 1
  max_size             = 1
  min_size             = 1
  launch_configuration = aws_launch_configuration.asg-lc-ec2.name

  lifecycle {
    create_before_destroy = true
  }
}
