resource "proxmox_vm_qemu" "proxmox_vm" {
  name        = local.vm_name
  target_node = var.target_node
  vmid        = var.vm_id
  clone       = var.ami
  full_clone  = true
  scsihw      = var.scsi_hw
  onboot      = var.onboot

  cpu {
    cores = var.cpu_core
  }

  memory = var.memory_size

  agent     = var.enable_agent
  skip_ipv6 = true

disk {
  slot     = var.disk_slot       
  type     = var.disk_type       
  storage  = var.storage         
  size     = var.disk_size       
  format   = var.disk_format     
  iothread = var.disk_iothread   
}

  network {
    id       = 0
    model    = "virtio"
    firewall = true
    bridge   = "vmbr0"
  }

  tags = local.tags
}
