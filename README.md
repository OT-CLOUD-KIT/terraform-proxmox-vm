# Terraform: Proxmox VM

A terraform module to create and manage proxmox virtual machines.

## Usage

```hcl
module "proxmox_vm" {
  source      = "OT-CLOUD-KIT/terraform-proxmox-vm"
  name        = "dummy-vm"
  target_node = "srv-01"
  vm_id       = 188
  cpu_core    = 1
  memory_size = 2048
  template    = "Ubuntu-24"
  storage     = "local"
  disk_size   = "30G"
  tags        = "dummy;prod"
}
```

## Requirements

| Name                                                                | Version    |
|---------------------------------------------------------------------|------------|
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 3.0.2-rc01 |

## Providers

| Name                                                          | Version    |
|---------------------------------------------------------------|------------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 3.0.2-rc01 |

## Modules

No modules.

## Resources

| Name                                                                                                                    | Type     |
|-------------------------------------------------------------------------------------------------------------------------|----------|
| [proxmox_vm_qemu.proxmox_vm](https://registry.terraform.io/providers/Telmate/proxmox/3.0.2-rc01/docs/resources/vm_qemu) | resource |

## Inputs

| Name                                                                  | Description                                               | Type     | Default                | Required |
|-----------------------------------------------------------------------|-----------------------------------------------------------|----------|------------------------|:--------:|
| <a name="input_cpu_core"></a> [cpu\_core](#input\_cpu\_core)          | Number of CPU core needs to be assigned                   | `number` | n/a                    |   yes    |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size)       | Size with G(GB) to create disk and attach it to VM        | `string` | `"30G"`                |    no    |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | Size of the memory in MBs for the VM                      | `number` | n/a                    |   yes    |
| <a name="input_name"></a> [name](#input\_name)                        | Name of the proxmox VM needs to be provisioned            | `string` | n/a                    |   yes    |
| <a name="input_scsi_hw"></a> [scsi\_hw](#input\_scsi\_hw)             | Name of the SCSI Hardware to create Disk                  | `string` | `"virtio-scsi-single"` |    no    |
| <a name="input_storage"></a> [storage](#input\_storage)               | Type of proxmox disk which needs to be attached           | `string` | `"local"`              |    no    |
| <a name="input_tags"></a> [tags](#input\_tags)                        | List of comma separated tags which needs to be attached   | `string` | `"proxmox"`            |    no    |
| <a name="input_target_node"></a> [target\_node](#input\_target\_node) | Target proxmox server on which VM needs to be provisioned | `string` | n/a                    |   yes    |
| <a name="input_template"></a> [template](#input\_template)            | Proxmox VM template to create the VM                      | `string` | n/a                    |   yes    |
| <a name="input_vm_id"></a> [vm\_id](#input\_vm\_id)                   | Unique ID of the target VM creation                       | `number` | n/a                    |   yes    |

## Outputs

| Name                                                           | Description             |
|----------------------------------------------------------------|-------------------------|
| <a name="output_id"></a> [id](#output\_id)                     | ID of the proxmox VM    |
| <a name="output_vm_state"></a> [vm\_state](#output\_vm\_state) | State of the proxmox VM |
