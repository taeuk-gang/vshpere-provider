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
write_files:
  - content: |
      Acquire {
        HTTP::proxy "http://192.168.30.10:3128";
        HTTPS::proxy "http://192.168.30.10:3128";
      }
    path: /etc/apt/apt.conf.d/proxy.conf
runcmd:
  - echo "HTTP_PROXY=http://192.168.30.10:3128" >>/etc/environment
  - echo "HTTPS_PROXY=http://192.168.30.10:3128" >>/etc/environment
  - echo "NO_PROXY=localhost,127.0.0.1,169.254.169.254,192.168.30.0/24,.sock,.acloud.lab" >>/etc/environment
  - echo "http_proxy=http://192.168.30.10:3128" >>/etc/environment
  - echo "https_proxy=http://192.168.30.10:3128" >>/etc/environment
  - echo "no_proxy=localhost,127.0.0.1,169.254.169.254,192.168.30.0/24,.sock,.acloud.lab" >>/etc/environment
  - chage -M -1 ubuntu
