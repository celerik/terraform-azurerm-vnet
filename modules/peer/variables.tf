variable "name" {
  type        = string
  description = "Name of the peering"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "remote_virtual_network_id" {
  type        = string
  description = "Identifier of the remote virtual network"
}

variable "allow_virtual_network_access" {
  type        = bool
  default     = true
  description = "Allow virtual network access"
}

variable "allow_forwarded_traffic" {
  type        = bool
  default     = true
  description = "Allow forwarded traffic"
}

variable "allow_gateway_transit" {
  type        = bool
  default     = false
  description = "Allow gateway transit"
}
