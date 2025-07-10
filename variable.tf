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
  default     = "hercules"
  validation {
    condition     = contains(["hercules", "ashwathama", "hanuman"], var.location)
    error_message = "Invalid location. Allowed values are: hercules, ashwathama, hanuman."
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

variable "identifier" {
  description = "Application identifier (allowed: build-agent, control-plane, deploy-agent, docs, ems, incident, jenkins, k8s, openops, orchestrator, tunneliq, uniteconpro)"
  type        = string
  default     = "uniteconpro"
  validation {
    condition = contains(
      ["build-agent", "control-plane", "deploy-agent", "docs", "ems", "incident", "jenkins", "k8s", "openops", "orchestrator", "tunneliq", "uniteconpro"],
      var.identifier
    )
    error_message = "Invalid identifier. Allowed values are: build-agent, control-plane, deploy-agent, docs, ems, incident, jenkins, k8s, openops, orchestrator, tunneliq, uniteconpro."
  }
}


variable "vertical" {
  description = "Business vertical (allowed: bp, coe, common, cost, olly, rapple, snaatak)"
  type        = string
  default     = "retail"
  validation {
    condition = contains(
      ["bp", "coe", "common", "cost", "olly", "rapple", "snaatak"],
      var.vertical
    )
    error_message = "Invalid vertical. Allowed values are: bp, coe, common, cost, olly, rapple, snaatak."
  }
}

variable "owner" {
  description = "Owner of the VM (must be a valid email ending with .com)"
  type        = string
  default     = "mail@opstree.com"
  validation {
    condition     = can(regex("^\\S+@\\S+\\.com$", var.owner))
    error_message = "Invalid owner. Must be a valid email address ending with .com (e.g., user@example.com)."
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
  description = "VM lifetime in days (e.g., 10, 30, 365). Use 0 for permanent."
  type        = number
  default     = 30
  validation {
    condition     = var.lifetime >= 0
    error_message = "lifetime must be a non-negative number. Use 0 for permanent."
  }
}

variable "operating_system" {
  description = "Operating system (e.g., ubuntu-24.04)"
  type        = string
  default     = "ubuntu-24"
  validation {
    condition     = length(trim(var.operating_system, " ")) > 0
    error_message = "operating_system must not be empty."
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
  default     = 301
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
  default     = "ubuntu-24"
  validation {
    condition     = contains(["ubuntu-24", "centos-9", "ubuntu20", "ubuntu-22.04"], var.ami)
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
