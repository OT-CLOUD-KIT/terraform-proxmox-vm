terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc01"
    }
  }
}

provider "proxmox" {
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "proxmox_vm" {
  name        = var.name
  target_node = var.target_node
  vmid        = var.vm_id
  cpu {
    cores = var.cpu_core
  }
  memory = var.memory_size
  clone  = var.ami
  scsihw = var.scsi_hw
  disks {
    scsi {
      scsi0 {
        disk {
          size    = var.disk_size
          storage = var.storage
        }
      }
    }
  }
  network {
    id       = 0
    model    = "virtio"
    firewall = true
    bridge   = "vmbr0"
  }
  tags = join(",", var.tags)
}