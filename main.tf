resource "proxmox_vm_qemu" "proxmox_vm" {
  name        = local.vm_name
  target_node = var.target_node
  vmid        = var.vm_id
  clone       = var.ami
  full_clone  = var.full_clone
  scsihw      = var.scsi_hw
  onboot      = var.onboot
  vm_state = var.vm_state
  
  cpu {
    cores = var.cpu_core
  }

  memory     = var.memory_size
  agent      = var.enable_agent
  skip_ipv6  = var.skip_ip

  disk {
    slot     = var.disk_slot
    type     = var.disk_type
    storage  = var.storage
    size     = var.disk_size
    # format   = var.disk_format
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
