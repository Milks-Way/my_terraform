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

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_metadata" {
  type = map
  default = {
    port = 1
    ssh-key = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCdR5yKVwC99rJFyRgpEZvLNK6mRCKOPCT+lQ/RZNqiAZgRdcImykrgYzZyO+si87FtGPf8xOXoHPi61jM/oRYYYUHAU0GmP40JqHPJWvr8/Tr6GZF1wEzTYCVs0WF+YfojasTlMuhGCbh3XtgDQZWMwUo+3aImMfahj008RlByB5AuohtG/+7qb5F1JNueKlaggzJSjUSGQUa3dXj8niK6cl4NZ3OSU1/0JJ2+URa1CXGKk+7rncdcIfb39sSrtgnl+usT6WR3APznm6DOgjLkrKAiO2B2J9VA1mqt/01CVFtdsdbEAi+km1KC6S08etghwh3WtNjC++QmD6QWT8DtirG6mWRYY0f25f7KNUpJaPV7WlPn7JMl0sqbB1Pt/kLcGq5aDrGRM2bRJffvKZbpPf+USA3WZgeJaoTM7UtA1qfyza1cTBRoUDcfmbBQmw2hATuPvv24fZz+R8TvLrNued8a7dp/khlBXfGu2NdPRm0dNL1T4/HoWKPZ7FWFhG8= noname@noname"
  }
}

variable "vm_web_ya__platform_id" {
  type        = string
  default     = "standard-v1"
  description = "yandex platform_id standard"
}

variable "each_resource" {
  type = map(object({
    cores = number
    memory = number
    core_fraction = number
  }))
  default = {
    "main" = {
      cores = 2
      memory = 4
      core_fraction = 5
    }
    "replica" = {
      cores = 2
      memory = 2
      core_fraction = 20
    }
  }
}