# dotfiles
## Overview

These are my dotfiles that I use for my workflow. 

## Installation

For initial installtion

```bash
sudo ./install.sh
```

## minikube kvm2 setup arch

https://www.techlear.com/2019/03/13/learning-kubernetes-locally-via-minikube-on-manjaro-archlinux/

### Dependency setup

Install packages
```
  sudo pacman -Sy libvirt qemu ebtables dnsmasq
```

Setup user group
``` 
  sudo usermod -a -G libvirt $(whoami)
  newgrp libvirt
```

Autostart services
```
  sudo systemctl start libvirtd.service
  sudo systemctl enable libvirtd.service
  sudo systemctl start virtlogd.service
  sudo systemctl enable virtlogd.service
```

### docker-machine and kvm

```
  sudo pacman -Sy docker-machine
  yaourt -Sy docker-machine-driver-kvm2
```

### Install minikube and kubectl

```
  yaourt -Sy minikube-bin kubectl-bin
```

To check install 

```
   minikube version
  whereis kubectl
  kubectl -h
```


