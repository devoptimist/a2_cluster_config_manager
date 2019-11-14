locals {
  instance_count = "${length(var.ips)}"
  tmp_path       = "${var.tmp_path}/config_patch"
  config         = "${var.config_file}"
}

resource "null_resource" "config_patch" {
  count    = "${local.instance_count}"

  triggers = {
    conf = "${md5(local.config)}"
  }

  connection {
    type        = "ssh"
    user        = "${var.user_name}"
    private_key = "${file(var.user_private_key)}"
    host        = "${var.ips[count.index]}"
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p ${local.tmp_path}"
    ]
  }

  provisioner "file" {
    content     = "${local.config}"
    destination = "${local.tmp_path}/config.toml"
  }

  provisioner "remote-exec" {
    inline = [
      "echo ${var.sudo_pass} | sudo -S chef-automate config patch ${local.tmp_path}/config.toml"
    ]
  }
}
