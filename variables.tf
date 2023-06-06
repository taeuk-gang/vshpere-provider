# Var template
#variable "" {
#  type = string
#  default = ""
#}

variable "vm_name" {
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

variable "vm_domain" {
  type    = string
  default = ".acloud.lab"
}

variable "vm_public_key" {
 type = string
 default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAqgwd1wyvsj9bHjmhC6Kxa5vhH7H1YQDIln5uciZbPhwTJh3g8T/eSB6jzFxBAsmGfPdE8YzhVk729npE7r+O1vpfi1pDoqCTYxV8Yp/IebyjtKoDNkJO1o7bExIxFhH3daGjhzPkGML8HADmT86yX24NFIjOlQTd2/p4SWwVYByg1CWJWyB4FsjanZUCA2Vhz7oQnzGL7X1m+vDqBncKNjwds1r5IC0ZCWWxbYxpbg/VYONVddDuB2rO9fFXc9vNdb1alC0uIk1UGapfivjvYHXx3deeZukuaMkPPreqm/qVswzLB5+uT+0fAFqisk8oGC9UkWuvioGKUHtC7kB+fZGjyfiPgoBtB53dCz3ZKkhIxAOhqcEJO9KOUcnVUGyOo3I9R7jCKbRulun2IWpeYwtk5aD07Hz8MwHf/YRdhrHO/XFXNLXgPlO2wfAyLukiRNHOStvB5TYNlG4GNwU00jnybcShO7TrZ61ajsjpCLi5hCmikz2zIeMksj+24ZE= ansil@ACLOUDLAB-MSTR"
}

variable "vm_password" {
  type = string
  default = "Ubuntu@123"
  sensitive   = true
}

variable "vm_net" {
  type    = string
  default = "DSwitch-VM Network"
}

variable "vm_template" {
  type    = string
  default = "ubuntu-jammy-22.04-cloudimg"
}

variable "vsphere_dc" {
  type    = string
  default = "ACloudLabDC"
}

variable "vsphere_datastore" {
  type    = string
  default = "vsanDatastore"
}

variable "vsphere_user" {
  type    = string
  default = "administrator@acloud.lab"
}

variable "vsphere_password" {
  type    = string
  default = "Vmware@123"
  sensitive   = true
}

variable "vsphere_server" {
  type    = string
  default = "vc.acloud.lab"
}

variable "vsphere_cluster" {
  type = string
  default = "ACloudLabCluster"
}

variable "vsphere_resource_pool" {
  type = string
  default = "ACloudLabResourcePool"
}
