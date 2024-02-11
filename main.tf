data "vsphere_datacenter" "datacenter" {
  name = var.vsphere_dc
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# data "vsphere_compute_cluster" "cluster" {
#   name          = var.vsphere_cluster
#   datacenter_id = data.vsphere_datacenter.datacenter.id
# }

data "vsphere_resource_pool" "pool" {
  name          = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# data "vsphere_host" "host" {
#   name          = var.vm_host
#   datacenter_id = data.vsphere_datacenter.datacenter.id
# }

data "vsphere_network" "network" {
  name          = var.vm_net
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vm_template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "template_file" "script" {
  template = file("cloud-config.tpl")
  vars = {
    public_key = var.public_key
    user_name = var.ssh_username
    user_password = var.vm_password
  }
}

data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    content_type = "text/cloud-config"
    content      = data.template_file.script.rendered
  }
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.name
  firmware         = "efi"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = var.vm_cpu
  memory           = var.vm_mem
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  extra_config {
    guestinfo.userdata.encoding = "gzip+base64"
    guestinfo.userdata = var.userdata
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }
}
