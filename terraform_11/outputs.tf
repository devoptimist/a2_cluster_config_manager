output "chef_server_config" {
  value = "${file(var.chef_server_config_file)}"
}

output "automate_config" {
  value = "${file(var.automate_config_file)}"
}
