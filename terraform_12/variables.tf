############ config module settings ##################

variable "existing_chef_server_ips" {
  description = "A list containing the ip addresses of the chef server frontends"
  type        = list
}

variable "existing_automate_ips" {
  description = "A list containing the ip addresses of the automate frontends"
  type        = list
}

variable "existing_ssh_user" {
  description = "The user name to use for ssh connections"
  type        = string
}

variable "existing_ssh_key_file" {
  description = "The path to an ssh private key to use for ssh connections"
  type        = string
}

variable "chef_server_config_file" {
  description = "The path to a file containing the chef server toml config"
  type        = string
}

variable "automate_config_file" {
  description = "The path to a file containing the automate toml config"
  type        = string
}

variable "existing_ssh_user_sudo_password" {
  description = "Password for sudo elevation if the ssh user needs it"
  type        = string
  default     = "" # can be left blank if root user or passwordless sudo 
}

variable "tmp_path" {
  description = "Location to copy config files to on the target system"
  type        = string
  default     = "/var/tmp"
}
