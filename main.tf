resource "proxmox_vm_qemu" "proxmox_vm" {
  name        = local.vm_name
  target_node = "hercules"
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

  
  disk {
    slot     = var.disk_slot
    type     = var.disk_type
    storage  = var.storage
    size     = var.disk_size
    iothread = var.disk_iothread
  }

  network {
    id       = var.network_id
    model    = var.network_model
    firewall = var.network_firewall
    bridge   = var.network_bridge
  }

  tags = local.tags

 
}
