resource "yandex_compute_disk" "my_disks" {
    count = 3
    name = "my-disk-${count.index}"
    type       = "network-hdd"
    zone       = var.default_zone
    size       = 1
    block_size = 4096
   
}

resource "yandex_compute_instance" "storage" {
    
    name = "storage"
    platform_id = var.vm_platform_id
    
    resources {
        cores         = 2
        memory        = 4
    }

    scheduling_policy {
        preemptible = true
    }

    dynamic "secondary_disk" {
        for_each = yandex_compute_disk.my_disks
        content {
            disk_id     = secondary_disk.value.id
        }
    }
    network_interface {
        subnet_id = "${yandex_vpc_subnet.develop.id}"
    }

    boot_disk {
        initialize_params {
            image_id = data.yandex_compute_image.ubuntu.image_id
        }
    }
    
}