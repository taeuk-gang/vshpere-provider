output "private_ip" {
  description = "The default IP address of the virtual machine deployed"
  value = vsphere_virtual_machine.vm.guest_ip_addresses[0]
}

output "public_ip" {
  description = "The default IP address of the virtual machine deployed"
  value = vsphere_virtual_machine.vm.guest_ip_addresses[0]
}

output "hostname" {
  description = "The default IP address of the virtual machine deployed"
  value = var.name 
}
