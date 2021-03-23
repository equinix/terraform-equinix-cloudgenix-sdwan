# Equinix Network Edge example: CloudGenix SD-WAN edge device

This example shows how to create redundant CloudGenix SD-WAN edge devices
on Platform Equinix using Equinix CloudGenix SD-WAN Terraform module and
Equinix Terraform provider.

In addition to pair of CloudGenix Virtual ION devices, following resources are
being created in this example:

* two ACL templates, one for each of the device

The devices are created in self managed, bring your own license modes.
Remaining parameters include:

* medium hardware platform (4CPU cores, 8GB of memory)
* Virtual ION 3104V software package
* device license keys and secrets
* 100 Mbps of additional internet bandwidth on each device
