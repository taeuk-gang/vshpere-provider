output "private_ip" {
  description = "The default IP address of the virtual machine deployed"
  value = vsphere_virtual_machine.vm.default_ip_address
}

output "public_ip" {
  description = "The default IP address of the virtual machine deployed"
  value = vsphere_virtual_machine.vm.default_ip_address
}

output "hostname" {
  description = "The default IP address of the virtual machine deployed"
  value = var.vm_name 
}