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
  for_each = var.vm_map

  name        = each.value.name
  target_node = each.value.target_node
  vmid        = each.value.vm_id

  cpu {
    cores = each.value.cpu_core
  }

  memory = each.value.memory_size
  clone  = each.value.ami
  scsihw = each.value.scsi_hw

  disks {
    scsi {
      scsi0 {
        disk {
          size    = each.value.disk_size
          storage = each.value.storage
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

  tags = each.value.tags
}
