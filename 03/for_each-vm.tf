resource "yandex_compute_instance" "for_each" {
    depends_on = [yandex_compute_instance.web]
   
    for_each = { for vm in var.vm_resource : vm.name => vm }

    name = each.value.name
    platform_id = var.vm_platform_id

    scheduling_policy {
        preemptible = true
    }

    resources {
        cores         = each.value.cores
        memory        = each.value.memory
        core_fraction = each.value.core_fraction
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