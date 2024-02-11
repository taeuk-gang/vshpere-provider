#cloud-config
users:
  - default
  - name: rocky
    ssh-authorized-keys:
      - ${public_key}
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: sudo
    shell: /bin/bash