variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the Vnet containing the subnets"
}

variable "name" {
  type        = string
  description = "Snet address range"
}

variable "snet_address_range" {
  type        = string
  description = "Snet address range"
}

variable "service_endpoints" {
  type        = set(string)
  description = "Service endpoints to enable"
  default     = []
}
