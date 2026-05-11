# Fetch all Harbor projects
data "harbor_projects" "all_projects" {}

# Apply retention policy dynamically
resource "harbor_retention_policy" "global_policy" {

  for_each = {
    for p in data.harbor_projects.all_projects.projects : p.name => p

    if (
      !contains(var.excluded_projects, p.name)
      &&
      (
        length(var.included_projects) == 0
        ||
        contains(var.included_projects, p.name)
      )
    )
  }

  scope = each.value.project_id

  schedule = var.schedule

  rule {

    most_recently_pushed = var.keep_latest_artifacts

    repo_matching = "**"

    tag_matching = "**"

    disabled = false
  }
}
