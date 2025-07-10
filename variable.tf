variable "name" {
  description = "Name of the VM"
  type        = string
  default     = "default-vm"
  validation {
    condition     = trim(var.name, "") != ""
    error_message = "VM name must not be empty or just whitespace."
  }
}

variable "target_node" {
  description = "Target Proxmox node"
  type        = string
  default     = "op-srv-01"
  validation {
    condition     = length(var.target_node) > 0
    error_message = "target_node must not be empty."
  }
}

variable "vm_id" {
  description = "VM ID"
  type        = number
  default     = 101
  validation {
    condition     = var.vm_id > 100 && var.vm_id < 9999
    error_message = "vm_id must be between 101 and 9998."
  }
}

variable "cpu_core" {
  description = "CPU cores"
  type        = number
  default     = 2
  validation {
    condition     = var.cpu_core >= 1 && var.cpu_core <= 30
    error_message = "cpu_core must be between 1 and 30."
  }
}

variable "memory_size" {
  description = "Memory in MB"
  type        = number
  default     = 2048
  validation {
    condition     = var.memory_size >= 1024 && var.memory_size <= 16384
    error_message = "memory_size must be between 1024 (1 GiB) MiB and 16 GiB (16384 MB)."
  }
}

variable "ami" {
  description = "AMI"
  type        = string
  default     = "Ubuntu-24"
  validation {
    condition     = contains(["ubuntu-24", "centos-9", "Ubuntu20", "ubuntu-22.04"], var.ami)
    error_message = "AMI must be one of the following: ubuntu-24, centos-9."
  }
}

variable "scsi_hw" {
  description = "SCSI hardware type"
  type        = string
  default     = "virtio-scsi-single"
  validation {
    condition     = contains(["virtio-scsi-single", "lsi", "scsi-hw"], var.scsi_hw)
    error_message = "scsi_hw must be one of: virtio-scsi-single, lsi, scsi-hw."
  }
}

variable "disk_size" {
  description = "Disk size"
  type        = string
  default     = "30G"
  validation {
    condition     = can(regex("^\\d+[GM]$", var.disk_size))
    error_message = "disk_size must be in the format like '30G' or '1024M'."
  }
}

variable "storage" {
  description = "Storage type"
  type        = string
  default     = "local"
  validation {
    condition     = length(var.storage) > 0
    error_message = "storage must not be empty."
  }
}

variable "tags" {
  description = "List of Tags 1 to 5"
  type        = string
  default     = "dummy;prod"
  validation {
    condition     = can(regex("^[a-zA-Z0-9;-]+$", var.tags))
    error_message = "Tags must be a string like 'dummy;prod' using valid characters."
  }
}

