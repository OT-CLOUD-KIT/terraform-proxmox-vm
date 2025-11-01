output "id" {
  description = "ID of the proxmox VM"
  value       = proxmox_vm_qemu.proxmox_vm.id
}

output "vm_state" {
  description = "State of the proxmox VM"
  value       = proxmox_vm_qemu.proxmox_vm.vm_state
}

output "vm_ip_address" {
  value = proxmox_vm_qemu.proxmox_vm.default_ipv4_address
}
