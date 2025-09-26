resource "proxmox_vm_qemu" "proxmox_vm" {
  name        = local.vm_name

  # Conditional target node
  target_node = var.location == "ashwathama" ? "op-srv-01" : var.location

  vmid        = var.vm_id
  clone       = var.ami
  full_clone  = true
  scsihw      = var.scsi_hw
  onboot      = var.onboot

  cpu {
    cores = var.cpu_core
  }

  memory     = var.memory_size
  agent      = 1
  skip_ipv6  = var.skip_ip

  # Primary disk
  disk {
    slot     = var.disk_slot
    type     = var.disk_type
    storage  = var.location
    size     = var.disk_size
    iothread = var.disk_iothread
  }

  # CDROM disk
  disk {
    slot    = "ide2"
    type    = "cdrom"
    storage = "local"
  }

  network {
    id       = var.network_id
    model    = var.network_model
    firewall = var.network_firewall
    bridge   = var.network_bridge
  }

  tags = local.tags
}
