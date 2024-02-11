groups:
  - docker
chpasswd:
  expire: false
  users:
    - name: ${user_name}
      password: ${user_password}
      type: text  
users:
  - default
  - name: ${user_name}
    ssh-authorized-keys:
      - ${public_key}
    sudo: ALL=(ALL) NOPASSWD:ALL
    lock-passwd: false
    groups: sudo, docker
    shell: /bin/bash
