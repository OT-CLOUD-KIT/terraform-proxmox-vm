resource "proxmox_vm_qemu" "proxmox_vm" {
  name        = local.vm_name
  target_node = var.target_node
  vmid        = var.vm_id

  cpu {
    cores = var.cpu_core
  }

  memory = var.memory_size
  clone  = var.ami
  scsihw = var.scsi_hw
  onboot = true


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

  tags = "${var.environment};${var.location};${var.role};${var.identifier};${var.vertical};${var.owner};${var.availability};${var.lifetime};${var.operating_system};${var.extra_tags}"
}
