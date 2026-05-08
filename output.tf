output "retention_policy_projects" {
  value = keys(harbor_retention_policy.global_policy)
}
