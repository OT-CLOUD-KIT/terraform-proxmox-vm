# Environment-level metadata
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
  description = "Application identifier (allowed: build-agent, control-plane, deploy-agent, docs, ems, incident, jenkins, sonarqube, k8s, openops, orchestrator, tunneliq, uniteconpro)"
  type        = string
  default     = "build-agent"
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
variable "target_node" {
  description = "Target Proxmox node where the VM will be provisioned"
  type        = string
  default     = "hanuman"
}

variable "vm_id" {
  description = "Unique VM ID"
  type        = number
  default     = 301
  validation {
    condition     = var.vm_id > 100 && var.vm_id < 9999
    error_message = "VM ID must be between 101 and 9998."
  }
}

variable "ami" {
  description = "Name of the VM template to clone"
  type        = string
  default     = "ubuntu-24"
  validation {
    condition     = contains(["ubuntu-24", "ubuntu-22.04", "ubuntu-20", "centos-9"], var.ami)
    error_message = "AMI must be one of: ubuntu-24, ubuntu-22.04, ubuntu-20, centos-9."
  }
}

variable "cpu_core" {
  description = "Number of CPU cores to assign to the VM"
  type        = number
  default     = 2
  validation {
    condition     = var.cpu_core >= 1 && var.cpu_core <= 30
    error_message = "CPU cores must be between 1 and 30."
  }
}

variable "memory_size" {
  description = "Amount of memory to assign to the VM in MB"
  type        = number
  default     = 2048
  validation {
    condition     = var.memory_size >= 1024 && var.memory_size <= 16384
    error_message = "Memory size must be between 1024 and 16384 MB."
  }
}

variable "disk_size" {
  description = "Size of the VM disk (e.g., 30G, 1024M)"
  type        = string
  default     = "30G"
  validation {
    condition     = can(regex("^\\d+[GM]$", var.disk_size))
    error_message = "Disk size must be specified like '30G' or '1024M'."
  }
}

variable "tags" {
  description = "Tags to apply to the VM"
  type        = string
  default     = "dev;ashwathama;app;uniteconpro;coe;mail-opstree-com;standard;30;ubuntu-24"
}

variable "extra_tags" {
  description = "Extra tags"
  type        = string
  default     = "deault-machine"
}
