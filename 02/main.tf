resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_ya__image
}
resource "yandex_compute_instance" "platform" {
  name        = "netology-${local.vm_name["env"]}-${local.vm_name["project"]}-${local.vm_name["web_role"]}"
  platform_id = var.vm_web_ya__platform_id
  resources {
    cores         = var.vms_resource.vm_web["cores"]
    memory        = var.vms_resource.vm_web["memory"]
    core_fraction = var.vms_resource.vm_web["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vm_metadata["port"]
    ssh-keys           = var.vm_metadata["ssh-key"]
  }

}

resource "yandex_compute_instance" "db_platform" {
  name        = "netology-${local.vm_name["env"]}-${local.vm_name["project"]}-${local.vm_name["db_role"]}"
  platform_id = var.vm_db_ya__platform_id
  resources {
    cores         = var.vms_resource.vm_db["cores"]
    memory        = var.vms_resource.vm_db["memory"]
    core_fraction = var.vms_resource.vm_db["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vm_metadata["port"]
    ssh-keys           = var.vm_metadata["ssh-key"]
  }

}
