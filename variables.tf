variable "location" {
  type        = string
  description = "The Azure region where the resources will be deployed (e.g., East US, West Europe)."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group to contain the virtual network."
}

variable "name" {
  type        = string
  description = "The name of the virtual network to be created."
}

variable "vnet_address_space" {
  type        = string
  description = "The address space for the virtual network in CIDR notation (e.g., 10.0.0.0/16)."
}

variable "dns_servers" {
  type        = list(any)
  description = "A list of custom DNS server IP addresses to associate with the virtual network. Defaults to an empty list."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "A map of key-value pairs to assign as tags to the virtual network. Defaults to an empty map."
  default     = {}
}
