variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group where the subnets will be created."
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network that contains the subnets."
}

variable "name" {
  type        = string
  description = "The name of the subnet to be created."
}

variable "snet_address_range" {
  type        = string
  description = "The address range for the subnet in CIDR notation (e.g., 10.0.1.0/24)."
}

variable "private_endpoint_network_policies" {
  type        = string
  description = "Enable or Disable network policies for the private endpoint on the subnet. Possible values are 'Disabled', 'Enabled', 'NetworkSecurityGroupEnabled' and 'RouteTableEnabled'. Defaults to 'Disabled'"
  default     = "Disabled"
}

variable "service_endpoints" {
  type        = set(string)
  description = "A set of service endpoints to enable for the subnet (e.g., Microsoft.Storage, Microsoft.Sql). Defaults to an empty set."
  default     = []
}

variable "delegation" {
  type = object({
    name = string
    service_delegation = object({
      name    = string
      actions = list(string)
    })
  })
  default = null
}
