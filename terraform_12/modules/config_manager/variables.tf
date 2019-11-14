variable "ips" {
  description = "A list containing the ip addresses this module will connect to"
  type    = list
}

variable "config_file" {
  description = "The toml config as a string"
  type        = string
}

variable "user_name" {
  description = "The user name of the ssh user"
  type        = string
}

variable "user_private_key" {
  description = "The ssh private key of the ssh user"
  type        = string
}

variable "sudo_pass" {
  description = "Password for sudo elevation if the ssh user needs it"
  type        = string
  default     = ""
}

variable "tmp_path" {
  description = "Location to copy config files to on the target system"
  type        = string
  default     = "/var/tmp"
}
