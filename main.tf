resource "proxmox_vm_qemu" "proxmox_vm" {
  name        = local.vm_name
  target_node = var.target_node
  vmid        = var.vm_id
  clone       = var.ami
  full_clone  = true
  scsihw      = "virtio-scsi-single"
  onboot      = true

  cpu {
    cores = var.cpu_core
  }

  memory    = var.memory_size
  agent     = 1
  skip_ipv6 = true

  # disk {
  #   slot     = "scsi0"
  #   type     = "disk"
  #   storage  = "local"
  #   size     = var.disk_size
  #   format   = "qcow2"
  #   iothread = true
  # }

  # network {
  #   id       = 0
  #   model    = "virtio"
  #   firewall = true
  #   bridge   = "vmbr0"
  # }

  tags = local.tags
}
