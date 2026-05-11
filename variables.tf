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
  default = "0 30 4 * * 0"
}

variable "excluded_projects" {
  description = "Projects to exclude from retention policy"
  type        = list(string)
  default     = ["library"]
}

variable "included_projects" {
  description = "Apply retention only to these projects. Empty means all projects."
  type        = list(string)
  default     = []
}
