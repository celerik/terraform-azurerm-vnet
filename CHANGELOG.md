# Changelog

All notable changes to this project will be documented in this file.

## [1.0.5] - 2025-04-11

### Added

- Added a new `peer` submodule for configuring VNet peering between virtual networks.
- Updated `README.md` to include usage and input details for the `peer` submodule.
- Updated `README.md` to reflect the Apache License 2.0.

## [1.0.4] - 2025-04-07

### Added

- Add Apache License file.

## [1.0.3] - 2025-03-26

### Added

- Introduced `private_endpoint_network_policies` property to the `snet` module for managing private endpoint network policies in subnets.

## [1.0.2] - 2025-03-21

### Added

- Generated `README.md` file for the module.
- Updated documentation for better clarity.

### Fixed

- Minor bug fixes in variable validation for `vnet_address_space`.

## [1.0.1] - 2025-03-17

### Fixed

- Resolved an issue where `dns_servers` defaulted incorrectly when not provided.
- Improved error handling for missing required variables.

## [1.0.0] - 2024-06-08

### Added

- Initial release of the Azure Virtual Network Terraform module.
- Support for creating a virtual network with custom DNS servers.
- Tagging support for resources.
- Outputs for virtual network ID and name.
