###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex compute image family"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "yandex platform_id standard"
}

variable "vm_resource" {
  type = list(object({
    name = string
    cores = number
    memory = number
    core_fraction = number
  }))
  default = [
    {
      name = "main"
      cores = 2
      memory = 4
      core_fraction = 5
    },
    {
      name = "replica"
      cores = 2
      memory = 2
      core_fraction = 20
    }
  ]
}