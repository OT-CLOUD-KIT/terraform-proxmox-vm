variable "harbor_url" {
  type = string
}

variable "harbor_username" {
  type = string
}

variable "harbor_password" {
  type      = string
  sensitive = true
}

variable "keep_latest_artifacts" {
  type    = number
  default = 10
}

variable "schedule" {
  type    = string
  default = "0 0 0 * * *"
}
