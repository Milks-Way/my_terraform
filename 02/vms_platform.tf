
variable "vm_web_ya__image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex compute image family"
}

variable "vm_web_ya__instance_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "yandex compute instance name"
}

variable "vm_web_ya__platform_id" {
  type        = string
  default     = "standard-v1"
  description = "yandex platform_id standard"
}

variable "vm_db_ya__image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex compute image family"
}

variable "vm_db_ya__instance_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "yandex compute instance name db"
}

variable "vm_db_ya__platform_id" {
  type        = string
  default     = "standard-v1"
  description = "yandex platform_id standard"
}

variable "vms_resource" {
  type = map(object({
    cores = number
    memory = number
    core_fraction = number
  }))
  default = {
    "vm_web" = {
      cores = 2
      memory = 4
      core_fraction = 5
    }
    "vm_db" = {
      cores = 2
      memory = 2
      core_fraction = 20
    }
  }
}

