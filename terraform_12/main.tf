terraform {
  required_version = "> 0.12.0"
}

module "chef_server_config" {
  source           = "./modules/config_manager"
  user_name        = var.a2_cluster_ssh_user
  user_private_key = var.a2_cluster_ssh_key
  sudo_pass        = var.a2_cluster_sudo_pass 
  ip               = var.existing_chef_server_ips
  config_file      = file(var.chef_server_config_file)
}

module "automate_server_config" {
  source           = "./modules/config_manager"
  user_name        = var.a2_cluster_ssh_user
  user_private_key = var.a2_cluster_ssh_key
  sudo_pass        = var.a2_cluster_sudo_pass 
  ip               = var.existing_automate_ips
  config_file      = file(var.automate_config_file)
}
