# Fetch all Harbor projects
data "harbor_projects" "all_projects" {}

# Apply retention policy to projects
resource "harbor_retention_policy" "global_policy" {

  for_each = {
    for p in data.harbor_projects.all_projects.projects : p.name => p
    if p.name != "library"
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
