resource "yandex_compute_instance" "web" {
    count = 2
    name = "netology-develop-platform-web-${count.index + 1}"
    platform_id = var.vm_platform_id
    
    resources {
        cores         = 2
        memory        = 4
    }

    scheduling_policy {
        preemptible = true
    }

    network_interface {
        subnet_id = "${yandex_vpc_subnet.develop.id}"
        security_group_ids = ["${yandex_vpc_security_group.example.id}"]
    }

    boot_disk {
        initialize_params {
            image_id = data.yandex_compute_image.ubuntu.image_id
        }
    }

    # metadata = {
    #     ssh-keys           = connect_ssh_key.vm.id
    # }
    
}