module "ec2_1_mudmuseum_com" {
  source = "../../modules/ec2_with_eip"

  instance_type                 = var.instance_type
  root_block_device_volume_size = var.root_block_device_volume_size
  root_block_device_volume_type = var.root_block_device_volume_type
  key_name                      = <%= output('key-pair-ec2-mudmuseum_com.key_name') %>
  security_group_ids            = [<%= output('security-group-mudmuseum_com.ids') %>]
}