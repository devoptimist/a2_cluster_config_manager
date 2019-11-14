terraform {
  required_version = "> 0.12.0"
}

module "chef_server_config" {
  source           = "./modules/config_manager"
  user_name        = var.existing_ssh_user
  user_private_key = var.existing_ssh_key_file
  sudo_pass        = var.existing_ssh_user_sudo_password
  ips              = var.existing_chef_server_ips
  config_file      = file(var.chef_server_config_file)
}

module "automate_server_config" {
  source           = "./modules/config_manager"
  user_name        = var.existing_ssh_user
  user_private_key = var.existing_ssh_key_file
  sudo_pass        = var.existing_ssh_user_sudo_password
  ips              = var.existing_automate_ips
  config_file      = file(var.automate_config_file)
}
