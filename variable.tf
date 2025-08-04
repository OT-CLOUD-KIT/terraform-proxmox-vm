variable "environment" {
  description = "Environment (must be one of: dev, qa, prod)"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "qa", "prod"], var.environment)
    error_message = "Invalid environment. Allowed values are: dev, qa, prod."
  }
}

variable "location" {
  description = "Location (must be one of: hercules, ashwathama, hanuman)"
  type        = string
  default     = "ashwathama"
  validation {
    condition     = contains(["hercules", "ashwathama", "hanuman"], var.location)
    error_message = "Invalid location. Allowed values are: hercules, ashwathama, hanuman."
  }
}

variable "role" {
  description = "Role of the VM (allowed: app, db, mw)"
  type        = string
  default     = "app"
  validation {
    condition     = contains(["app", "db", "mw"], var.role)
    error_message = "Invalid role. Allowed values are: app, db, mw."
  }
}

variable "identifier" {
  description = "Application identifier"
  type        = string
  default     = "uniteconpro"
}

variable "vertical" {
  description = "Business vertical"
  type        = string
  default     = "coe"
  validation {
    condition     = contains(["bp", "coe", "common", "cost", "olly", "rapple", "snaatak"], var.vertical)
    error_message = "Invalid vertical."
  }
}

variable "owner" {
  description = "Sanitized owner name"
  type        = string
  default     = "mail.opstree.com"
  validation {
    condition     = can(regex("^[a-zA-Z0-9._-]+$", var.owner))
    error_message = "Invalid owner. Use only letters, numbers, hyphens (-), underscores (_), or dots (.)."
  }
}


variable "availability" {
  description = "Availability type"
  type        = string
  default     = "standard"
  validation {
    condition     = contains(["standard", "HA"], var.availability)
    error_message = "Availability must be either 'standard' or 'HA'."
  }
}

variable "lifetime" {
  description = "VM lifetime in days"
  type        = number
  default     = 30
  validation {
    condition     = var.lifetime >= 0
    error_message = "Lifetime must be a non-negative number."
  }
}

variable "operating_system" {
  description = "Operating system"
  type        = string
  default     = "ubuntu-24"
  validation {
    condition     = contains(["ubuntu-24", "ubuntu-20"], var.operating_system)
    error_message = "Operating system must be either 'ubuntu-24' or 'ubuntu-20'."
  }
}

variable "target_node" {
  description = "Target Proxmox node"
  type        = string
  default     = "hanuman"
  validation {
    condition     = length(var.target_node) > 0
    error_message = "Target node must not be empty."
  }
}

variable "vm_id" {
  description = "VM ID"
  type        = number
  default     = 301
  validation {
    condition     = var.vm_id > 100 && var.vm_id < 9999
    error_message = "VM ID must be between 101 and 9998."
  }
}

variable "cpu_core" {
  description = "CPU cores"
  type        = number
  default     = 2
  validation {
    condition     = var.cpu_core >= 1 && var.cpu_core <= 30
    error_message = "CPU cores must be between 1 and 30."
  }
}

variable "memory_size" {
  description = "Memory in MB"
  type        = number
  default     = 2048
  validation {
    condition     = var.memory_size >= 1024 && var.memory_size <= 16384
    error_message = "Memory size must be between 1024 and 16384 MB."
  }
}

variable "ami" {
  description = "Template to clone from"
  type        = string
  default     = "ubuntu-24"
  validation {
    condition     = contains(["ubuntu-24", "centos-9", "ubuntu-20", "ubuntu-22.04"], var.ami)
    error_message = "AMI must be one of: ubuntu-24, ubuntu-20, ubuntu-22.04, centos-9."
  }
}

variable "scsi_hw" {
  description = "SCSI hardware type"
  type        = string
  default     = "virtio-scsi-single"
  validation {
    condition     = contains(["virtio-scsi-single", "lsi", "scsi-hw"], var.scsi_hw)
    error_message = "SCSI hardware must be one of: virtio-scsi-single, lsi, scsi-hw."
  }
}

variable "disk_slot" {
  description = "Disk slot"
  type        = string
  default     = "scsi0"
}

variable "disk_type" {
  description = "Disk type"
  type        = string
  default     = "disk"
}

variable "disk_size" {
  description = "Disk size"
  type        = string
  default     = "30G"
  validation {
    condition     = can(regex("^\\d+[GM]$", var.disk_size))
    error_message = "Disk size must be like '30G' or '1024M'."
  }
}

variable "storage" {
  description = "Storage pool name"
  type        = string
  default     = "local"
  validation {
    condition     = length(var.storage) > 0
    error_message = "Storage must not be empty."
  }
}

variable "disk_format" {
  description = "Disk format"
  type        = string
  default     = "qcow2"
}

variable "disk_iothread" {
  description = "Enable IO thread"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Semicolon-separated tags"
  type        = string
  default     = "dev;ashwathama;app;uniteconpro;coe;mail-opstree-com;standard;30;ubuntu-24"
}

variable "extra_tags" {
  description = "Extra tags"
  type        = string
  default     = "deault-machine"
}

variable "enable_agent" {
  description = "Enable QEMU guest agent"
  type        = number
  default     = 1
}

variable "onboot" {
  description = "Start VM on boot"
  type        = bool
  default     = true
}

variable "full_clone" {
  description = "Full clone option"
  type        = bool
  default     = false
}

variable "skip_ip" {
  description = "Skip IPv6 config"
  type        = bool
  default     = true
}

variable "network_id" {
  description = "Network ID"
  type        = number
  default     = 0
}

variable "network_model" {
  description = "NIC model"
  type        = string
  default     = "virtio"
  validation {
    condition     = contains(["virtio", "e1000", "rtl8139"], var.network_model)
    error_message = "NIC model must be one of: virtio, e1000, rtl8139."
  }
}

variable "network_firewall" {
  description = "Enable firewall"
  type        = bool
  default     = true
}

variable "network_bridge" {
  description = "NIC bridge"
  type        = string
  default     = "vmbr0"
  validation {
    condition     = length(var.network_bridge) > 0
    error_message = "NIC bridge must not be empty."
  }
}
