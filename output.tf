output "id" {
  description = "ID of the proxmox VM"
  value       = proxmox_vm_qemu.proxmox_vm.vmid
}

output "vm_state" {
  description = "State of the proxmox VM"
  value       = proxmox_vm_qemu.proxmox_vm.vm_state
}
