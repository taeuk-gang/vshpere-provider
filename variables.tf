variable "name" {
  type    = string
  default = "sample-node"
}

variable "vm_cpu" {
 type = string
 default = "2"
}

variable "vm_mem" {
 type = string
 default = "4096"
}

variable "vm_host" {
  type    = string
  default = "host"
}

variable "public_key" {
 type = string
 default = "ssh-rsa test local@local"
}

variable "ssh_username" {
  type = string
}
variable "vm_password" {
  type = string
  default = "password"
}

variable "vm_net" {
  type    = string
  default = "vm Network"
}

variable "vm_template" {
  type    = string
  default = "template"
}

variable "vsphere_dc" {
  type    = string
  default = "dc"
}

variable "vsphere_datastore" {
  type    = string
  default = "store"
}

variable "vsphere_user" {
  type    = string
  default = "root@server"
}

variable "vsphere_password" {
  type    = string
  default = "password"
}

variable "vsphere_server" {
  type    = string
  default = "server"
}

variable "vsphere_cluster" {
  type = string
  default = "cluster"
}

variable "vsphere_resource_pool" {
  type = string
  default = "resourcePool"
}
variable "cloud_config" {
  type = string
  default = ""
}
