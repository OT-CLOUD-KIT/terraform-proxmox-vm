variable "vm_map" {
  description = "Map of VM configurations keyed by VM name"

  type = map(object({
    name         = string
    target_node  = string
    vm_id        = number
    cpu_core     = number
    memory_size  = number
    ami          = string
    scsi_hw      = string
    disk_size    = string
    storage      = string
    tags         = string
  }))

  default = {
    default-vm = {
      name         = "default-vm"
      target_node  = "op-srv-01"
      vm_id        = 188
            cpu_core     = 2
      memory_size  = 2048
      ami          = "Ubuntu-24"
      scsi_hw      = "virtio-scsi-single"
      disk_size    = "30G"
      storage      = "local"
      tags         = "dummy;prod"
    }
  }

  validation {
    condition = alltrue([
      for vm in values(var.vm_map) :
        trim(vm.name, "") != ""
    ])
    error_message = "VM name must not be empty or just whitespace."
  }

  validation {
    condition = alltrue([
      for vm in values(var.vm_map) :
        length(vm.target_node) > 0
    ])
    error_message = "target_node must not be empty."
  }

  validation {
    condition = alltrue([
      for vm in values(var.vm_map) :
        vm.vm_id > 100 && vm.vm_id < 9999
    ])
    error_message = "vm_id must be between 101 and 9998."
  }

  validation {
    condition = alltrue([
      for vm in values(var.vm_map) :
        vm.cpu_core >= 1 && vm.cpu_core <= 30
    ])
    error_message = "cpu_core must be between 1 and 30."
  }

  validation {
    condition = alltrue([
      for vm in values(var.vm_map) :
        vm.memory_size >= 1024 && vm.memory_size <= 16384
    ])
    error_message = "memory_size must be between 1024 (1 GiB) and 16384 MB (16 GiB)."
  }

  validation {
    condition = alltrue([
      for vm in values(var.vm_map) :
        contains(["Ubuntu-24", "centos-9", "Ubuntu20", "ubuntu-22.04"], vm.ami)
    ])
    error_message = "AMI must be one of: Ubuntu-24, centos-9, Ubuntu20, ubuntu-22.04."
  }

  validation {
    condition = alltrue([
      for vm in values(var.vm_map) :
        contains(["virtio-scsi-single", "lsi", "scsi-hw"], vm.scsi_hw)
    ])
    error_message = "scsi_hw must be one of: virtio-scsi-single, lsi, scsi-hw."
  }

  validation {
    condition = alltrue([
      for vm in values(var.vm_map) :
        can(regex("^\\d+[GM]$", vm.disk_size))
    ])
    error_message = "disk_size must be in the format like '30G' or '1024M'."
  }

  validation {
    condition = alltrue([
      for vm in values(var.vm_map) :
        length(vm.storage) > 0
    ])
    error_message = "storage must not be empty."
  }

  validation {
    condition = alltrue([
      for vm in values(var.vm_map) :
        can(regex("^[a-zA-Z0-9;-]+$", vm.tags))
    ])
    error_message = "Tags must be a string like 'dummy;prod' using valid characters."
  }
}
