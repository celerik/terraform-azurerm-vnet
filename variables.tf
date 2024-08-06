variable "location" {
  type        = string
  description = "Region to create environment"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "name" {
  type        = string
  description = "Vnet name"
}

variable "vnet_address_space" {
  type        = string
  description = "Vnet address space"
}

variable "dns_servers" {
  type        = list(any)
  description = "List of custom dns servers"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}
