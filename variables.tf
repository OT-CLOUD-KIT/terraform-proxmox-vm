variable "name" {
  description = "Name of the proxmox VM needs to be provisioned"
  type        = string
}

variable "target_node" {
  description = "Target proxmox server on which VM needs to be provisioned"
  type        = string
}

variable "vm_id" {
  description = "Unique ID of the target VM creation"
  type        = number
}

variable "cpu_core" {
  description = "Number of CPU core needs to be assigned"
  type        = number
}

variable "memory_size" {
  description = "Size of the memory in MBs for the VM"
  type        = number
}

variable "template" {
  description = "Proxmox VM template to create the VM"
  type        = string
}

variable "scsi_hw" {
  description = "Name of the SCSI Hardware to create Disk"
  type        = string
  default     = "virtio-scsi-single"
}

variable "disk_size" {
  description = "Size with G(GB) to create disk and attach it to VM"
  type        = string
  default     = "30G"
}

variable "storage" {
  description = "Type of proxmox disk which needs to be attached"
  type        = string
  default     = "local"
}

variable "tags" {
  description = "List of comma separated tags which needs to be attached"
  type        = string
  default     = "proxmox"
}
