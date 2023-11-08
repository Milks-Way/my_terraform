data template_file "userdata" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    username = var.username
    ssh_public_key = file("~/.ssh/id_rsa.pub")
    # ssh_key = ""
    }
}