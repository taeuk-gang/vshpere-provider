#cloud-config
users:
  - default
  - name: ubuntu
    ssh-authorized-keys:
      - ${public_key}
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: sudo, docker
    shell: /bin/bash