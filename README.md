# Terraform Azure Virtual Network Module

This Terraform module creates an Azure Virtual Network (VNet) and supports the configuration of subnets as part of the VNet. It also includes a submodule for configuring VNet peering.

## Features

- Creates an Azure Virtual Network (`azurerm_virtual_network`).
- Supports custom DNS servers.
- Allows tagging of resources.
- Provides outputs for the VNet's ID and name.
- Includes a submodule for creating subnets with service endpoints, address ranges, and private endpoint network policies.
- Includes a submodule for configuring VNet peering between virtual networks.

## Usage

### Virtual Network and Subnet

```hcl
module "vnet" {
  source = "./modules/terraform-azurerm-vnet"

  name                = "my-vnet"
  location            = "East US"
  resource_group_name = "my-resource-group"
  vnet_address_space  = "10.0.0.0/16"
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  tags = {
    environment = "production"
    owner       = "team"
  }
}

module "subnet" {
  source = "./modules/terraform-azurerm-vnet/modules/snet"

  name                              = "my-subnet"
  resource_group_name               = "my-resource-group"
  virtual_network_name              = module.vnet.name
  snet_address_range                = "10.0.1.0/24"
  service_endpoints                 = ["Microsoft.Storage"]
  private_endpoint_network_policies = false
}
```

### VNet Peering

```hcl
module "vnet_peering" {
  source = "./modules/terraform-azurerm-vnet/modules/peer"

  name                  = "my-vnet-peering"
  resource_group_name   = "my-resource-group"
  virtual_network_name  = module.vnet.name
  remote_virtual_network_id = "remote-vnet-id"
  allow_forwarded_traffic = true
  allow_gateway_transit   = false
  use_remote_gateways     = false
}
```

## Inputs

### Virtual Network Inputs

| Name                | Type          | Description                                                                 | Default |
|---------------------|---------------|-----------------------------------------------------------------------------|---------|
| `location`          | `string`      | The Azure region where the resources will be deployed.                      |         |
| `resource_group_name` | `string`    | The name of the Azure Resource Group to contain the virtual network.         |         |
| `name`              | `string`      | The name of the virtual network to be created.                              |         |
| `vnet_address_space` | `string`     | The address space for the virtual network in CIDR notation.                 |         |
| `dns_servers`       | `list(any)`   | A list of custom DNS server IP addresses to associate with the virtual network. Defaults to an empty list. | `[]`    |
| `tags`              | `map(string)` | A map of key-value pairs to assign as tags to the virtual network. Defaults to an empty map. | `{}`    |

### Subnet Inputs

| Name                             | Type          | Description                                                                 | Default |
|----------------------------------|---------------|-----------------------------------------------------------------------------|---------|
| `resource_group_name`            | `string`      | The name of the Azure Resource Group where the subnets will be created.     |         |
| `virtual_network_name`           | `string`      | The name of the virtual network that contains the subnets.                  |         |
| `name`                           | `string`      | The name of the subnet to be created.                                       |         |
| `snet_address_range`             | `string`      | The address range for the subnet in CIDR notation.                          |         |
| `service_endpoints`              | `set(string)` | A set of service endpoints to enable for the subnet. Defaults to an empty set. | `[]`    |
| `private_endpoint_network_policies` | `string`     | Whether to enable or disable private endpoint network policies for the subnet. Defaults to `Disabled`. | `Disabled`  |

### VNet Peering Inputs

| Name                     | Type          | Description                                                                 | Default |
|--------------------------|---------------|-----------------------------------------------------------------------------|---------|
| `name`                   | `string`      | The name of the VNet peering connection.                                    |         |
| `resource_group_name`    | `string`      | The name of the Azure Resource Group where the VNet peering will be created.|         |
| `virtual_network_name`   | `string`      | The name of the local virtual network.                                      |         |
| `remote_virtual_network_id` | `string`   | The ID of the remote virtual network to peer with.                          |         |
| `allow_forwarded_traffic` | `bool`       | Whether to allow forwarded traffic in the peering. Defaults to `false`.     | `false` |
| `allow_gateway_transit`   | `bool`       | Whether to allow gateway transit in the peering. Defaults to `false`.       | `false` |
| `use_remote_gateways`     | `bool`       | Whether to use remote gateways in the peering. Defaults to `false`.         | `false` |

## Outputs

### Virtual Network Outputs

| Name  | Description                              |
|-------|------------------------------------------|
| `id`  | The ID of the created virtual network.   |
| `name`| The name of the created virtual network. |

### Subnet Outputs

| Name  | Description                              |
|-------|------------------------------------------|
| `id`  | The ID of the created subnet.            |

### VNet Peering Outputs

| Name  | Description                              |
|-------|------------------------------------------|
| `id`  | The ID of the created VNet peering.      |

## Requirements

### Terraform Version

- Terraform `>= 1.10`

### Providers

- AzureRM `>= 4.0`

## File Structure

```bash
.
├── main.tf
├── outputs.tf
├── variables.tf
├── versions.tf
├── modules/
│   ├── snet/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   │   ├── versions.tf
│   └── peer/
│       ├── main.tf
│       ├── outputs.tf
│       ├── variables.tf
│       ├── versions.tf
```

## License

This module is licensed under the Apache License 2.0. See [LICENSE](LICENSE) for details.
