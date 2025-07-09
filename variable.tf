variable "environment" {
  description = "Environment (e.g., dev, prod)"
  type        = string
  default     = "dev"
  validation {
    condition     = length(trim(var.environment, " ")) > 0
    error_message = "environment must not be empty."
  }
}

variable "location" {
  description = "Location (e.g., delhi)"
  type        = string
  default     = "delhi"
  validation {
    condition     = length(trim(var.location, " ")) > 0
    error_message = "location must not be empty."
  }
}

variable "role" {
  description = "Role (e.g., web, db)"
  type        = string
  default     = "web"
  validation {
    condition     = length(trim(var.role, " ")) > 0
    error_message = "role must not be empty."
  }
}

variable "application" {
  description = "Application (e.g., checkout)"
  type        = string
  default     = "checkout"
  validation {
    condition     = length(trim(var.application, " ")) > 0
    error_message = "application must not be empty."
  }
}

variable "vertical" {
  description = "Business vertical (e.g., retail)"
  type        = string
  default     = "retail"
  validation {
    condition     = length(trim(var.vertical, " ")) > 0
    error_message = "vertical must not be empty."
  }
}

variable "owner" {
  description = "Owner of the VM (e.g., mohit.saini)"
  type        = string
  default     = "mohit.saini"
  validation {
    condition     = length(trim(var.owner, " ")) > 0
    error_message = "owner must not be empty."
  }
}

variable "availability" {
  description = "Availability type (e.g., HA, standard)"
  type        = string
  default     = "standard"
  validation {
    condition     = contains(["standard", "HA"], var.availability)
    error_message = "availability must be either 'standard' or 'HA'."
  }
}

variable "lifetime" {
  description = "VM lifetime (e.g., short, long, permanent)"
  type        = string
  default     = "long"
  validation {
    condition     = contains(["short", "long", "permanent"], var.lifetime)
    error_message = "lifetime must be one of: short, long, permanent."
  }
}

variable "operating_system" {
  description = "Operating system (e.g., ubuntu-24.04)"
  type        = string
  default     = "ubuntu-24.04"
  validation {
    condition     = length(trim(var.operating_system, " ")) > 0
    error_message = "operating_system must not be empty."
  }
}

# ========================
# VM Provisioning Settings
# ========================

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
    error_message = "memory_size must be between 1024 and 16384 MB."
  }
}

variable "ami" {
  description = "Template to clone from"
  type        = string
  default     = "Ubuntu-24"
  validation {
    condition     = contains(["Ubuntu-24", "centos-9", "Ubuntu20", "ubuntu-22.04"], var.ami)
    error_message = "ami must be one of: Ubuntu-24, centos-9, Ubuntu20, ubuntu-22.04."
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
  description = "Storage pool name"
  type        = string
  default     = "local"
  validation {
    condition     = length(var.storage) > 0
    error_message = "storage must not be empty."
  }
}
variable "tags" {
  description = "Semicolon-separated tags (e.g., dev;delhi;web;checkout;retail)"
  type        = string
  default     = "dev;delhi;web;checkout;retail;mohit.saini;standard;long;ubuntu-24.04"
}
