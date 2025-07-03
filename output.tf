output "vm_ids" {
  description = "VM IDs per instance"
  value = {
    for k, vm in proxmox_vm_qemu.proxmox_vm : k => vm.id
  }
}

output "vm_states" {
  description = "VM states per instance"
  value = {
    for k, vm in proxmox_vm_qemu.proxmox_vm : k => vm.vm_state
  }
}
